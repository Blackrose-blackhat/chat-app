import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onTap;
  final TextInputType type;
  final String hint;
  final bool isObscure;
  const CustomTextField(
      {super.key,
      required this.onTap,
      required this.hint,
      required this.isObscure,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      textAlign: TextAlign.center,
      obscureText: isObscure,
      onChanged: onTap,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
