import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Text(
            note.body.getOrCrash(),
            style: const TextStyle(fontSize: 18),
          ),
          if (note.todos.length > 0) ...[
            const SizedBox(height: 4),
            Wrap(
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
    );
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
