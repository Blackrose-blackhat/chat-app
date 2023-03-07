import 'package:chaaat/screens/login_page.dart';
import 'package:chaaat/screens/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:chaaat/widgets/customButton.dart';
import 'package:chaaat/screens/routers.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome-screen';

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Hero(
                    tag: 'logo',
                    child: Image(
                      height: 110,
                      width: 90,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Text('FLASH CHAT'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Login',
                onTap: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Registration',
                onTap: () {
                  Navigator.of(context).pushNamed(RegistrationScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
