import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/application/auth/auth_bloc.dart';
import 'package:flutter_todo_list/application/notes/note_actor/note_actor_bloc.dart';
import 'package:flutter_todo_list/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_todo_list/injection.dart';
import 'package:flutter_todo_list/presentation/routes/router.gr.dart';

@RoutePage()
class NotesOverViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: ((context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    AutoRouter.of(context).replace(const SignInRoute()),
                orElse: () {},
              );
            }),
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
              listener: (context, state) {
            state.maybeMap(
              deleteFailure: (state) {
                FlushbarHelper.createError(
                  duration: const Duration(seconds: 5),
                  message: state.noteFailure.map(
                    unexpected: (_) =>
                        'Unexpected error occured while deleting, please contact support.',
                    insufficientPermission: (_) => 'Insufficient Permission.',
                    unableToUpdate: (_) => 'Imposible Error',
                    unableToDelete: (_) => 'Imposible Error',
                  ),
                ).show(context);
              },
              orElse: () {},
            );
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Notes"),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.indeterminate_check_box),
                onPressed: () {},
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: Navigate to NoteFormPage
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
