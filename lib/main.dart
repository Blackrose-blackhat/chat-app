import 'package:chaaat/screens/chat_screen.dart';
import 'package:chaaat/screens/login_page.dart';
import 'package:chaaat/screens/routers.dart';
import 'package:chaaat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chaaat/screens/registration_page.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => RouteGenerate.generateRoute(settings),
      initialRoute: WelcomeScreen.routeName,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black45,
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
