import 'package:chaaat/screens/login_page.dart';
import 'package:chaaat/screens/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:chaaat/widgets/customButton.dart';
import 'package:chaaat/screens/routers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome-screen';

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const Hero(
                    tag: 'logo',
                    child: Image(
                      height: 60.0,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                  )
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
