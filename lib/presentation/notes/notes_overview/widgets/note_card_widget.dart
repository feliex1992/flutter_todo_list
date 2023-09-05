import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/application/notes/note_actor/note_actor_bloc.dart';
import 'package:flutter_todo_list/domain/notes/note.dart';
import 'package:flutter_todo_list/domain/notes/todo_item.dart';
import 'package:kt_dart/kt.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () {
          // TODO: implement navigation.
        },
        onLongPress: () {
          final noteActorBloc = context.read<NoteActorBloc>();
          _showDeletionDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(fontSize: 18),
              ),
              if (note.todos.length > 0) ...[
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: [
                    ...note.todos
                        .getOrCrash()
                        .map(
                          (todo) => TodoDisplay(
                            todo: todo,
                          ),
                        )
                        .iter,
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletionDialog(BuildContext context, NoteActorBloc noteActorBloc) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Selected Note:"),
            content: Text(
              note.body.getOrCrash(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("CANCEL"),
              ),
              TextButton(
                onPressed: () {
                  noteActorBloc.add(NoteActorEvent.deleted(note));
                  Navigator.pop(context);
                },
                child: const Text("DELETE"),
              ),
            ],
          );
        });
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.done)
          Icon(
            Icons.check_box,
            color: Theme.of(context).colorScheme.secondary,
          ),
        if (!todo.done)
          Icon(
            Icons.check_box_outline_blank,
            color: Theme.of(context).disabledColor,
          ),
        Text(todo.name.getOrCrash()),
      ],
    );
  }
}
