import 'package:flutter/material.dart';
import 'package:chaaat/widgets/customButton.dart';
import 'package:chaaat/screens/routers.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                height: 130,
                width: 130,
                image: AssetImage('assets/images/logo.png'),
              ),
              const Text('CHAT'),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Login',
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Registration',
                onTap: () {
                  Navigator.of(context).pushNamed('/Register-screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
