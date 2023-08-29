import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/application/auth/auth_bloc.dart';
import 'package:flutter_todo_list/injection.dart';
import 'package:flutter_todo_list/presentation/routes/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp.router(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().config(),
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.green[800],
            secondary: Colors.blueAccent,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
