import 'package:chaaat/screens/chat_screen.dart';
import 'package:chaaat/widgets/customButton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/customTextField.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
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
                  isObscure: false,
                  onTap: (val) {
                    email = val;
                  },
                  hint: 'Enter your email',
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  onTap: (val) {
                    password = val;
                    //implement username
                  },
                  hint: 'Enter Your password',
                  isObscure: true,
                  type: TextInputType.emailAddress,
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
                        final login = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        login != null
                            ? Navigator.of(context)
                                .pushNamed(ChatScreen.routeName)
                            : Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                      //implement login functionality
                    },
                    text: 'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
