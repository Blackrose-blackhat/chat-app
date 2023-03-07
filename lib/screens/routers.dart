import 'package:chaaat/main.dart';
import 'package:chaaat/screens/chat_screen.dart';
import 'package:chaaat/screens/login_page.dart';
import 'package:chaaat/screens/registration_page.dart';
import 'package:chaaat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: ((context) => WelcomeScreen()));

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: ((context) => LoginScreen()));

      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: ((context) => RegistrationScreen()));

      case ChatScreen.routeName:
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
