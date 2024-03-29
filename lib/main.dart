import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_todo_list/injection.dart';
import 'package:flutter_todo_list/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.get("FIREBASE_API_KEY"),
      appId: dotenv.get("FIREBASE_APP_ID"),
      messagingSenderId: dotenv.get("FIREBASE_MSG_SENDER_ID"),
      projectId: dotenv.get("FIREBASE_PROJECT_ID"),
    ),
  );
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
