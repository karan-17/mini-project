import 'package:flutter/material.dart';

class Data extends StatelessWidget {

  final String text, image;

  const Data({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(flex: 2,),
            Text(
              "SIMLOCK",
              style: TextStyle(
                  color: Color(0xff374ABE),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
            const Spacer(),
            Text(text,style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            const Spacer(flex: 2,),
            Image.asset(
              image,
              height: 265,
              width: 235,
            ),
          ],
        ),
      ),
    );
  }
}