import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  Function function;
  String text;
  ContinueButton({
    Key? key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff374ABE),
            Color(0xff3DB2FF),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0),
        child: Text(
          text,
          style:
              TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Muli'),
        ),
      ),
    );
  }
}
