import 'package:chaaat/screens/chat_screen.dart';
import 'package:chaaat/screens/login_page.dart';
import 'package:chaaat/widgets/customButton.dart';
import 'package:chaaat/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/Register-screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                CustomTextField(
                  onTap: (val) {
                    email = val;
                  },
                  hint: 'Enter your email',
                  isObscure: false,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  onTap: (val) {
                    password = val;
                  },
                  hint: 'Enter your password',
                  isObscure: true,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomButton(
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser = _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        newUser != null
                            ? Navigator.of(context)
                                .pushNamed(ChatScreen.routeName)
                            : Navigator.pushNamed(
                                context, LoginScreen.routeName);
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    text: 'Register',
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
