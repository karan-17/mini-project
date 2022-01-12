import 'package:flutter/material.dart';

class SignUpPageHeaderText extends StatelessWidget {
  String heading, byLine;
  SignUpPageHeaderText({required this.heading, required this.byLine});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          heading,
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,
              fontFamily: 'Muli'),
        ),
        Text(
          byLine,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffB9B9B9),
              height: 1.5,
              fontFamily: 'Muli'),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
