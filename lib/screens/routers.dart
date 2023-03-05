import 'package:chaaat/main.dart';
import 'package:chaaat/screens/chat_screen.dart';
import 'package:chaaat/screens/login_page.dart';
import 'package:chaaat/screens/registration_page.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => MyApp()));

      case '/login-screen':
        return MaterialPageRoute(builder: ((context) => LoginScreen()));

      case '/Register-screen':
        return MaterialPageRoute(builder: ((context) => RegistrationScreen()));

      case '/Chat-screen':
        return MaterialPageRoute(builder: ((context) => ChatScreen()));

      default:
        return MaterialPageRoute(
          builder: ((context) => Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Error'),
                ),
                body: Center(
                  child: Text('Error 404 Page not Found'),
                ),
              )),
        );
    }
  }
}
