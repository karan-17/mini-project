import 'package:flutter/material.dart';

class SignUpPageFooterText extends StatelessWidget {
  String text;
  SignUpPageFooterText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xffB9B9B9),
          height: 1.5,
          fontFamily: 'Muli'),
      textAlign: TextAlign.center,
    );
  }
}
