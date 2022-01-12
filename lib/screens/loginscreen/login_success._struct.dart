import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlockapp/core/customAppBar.dart';
import 'package:simlockapp/core/common_button.dart';

class LoginSuccess extends StatelessWidget {
  static const routeName= '/login-success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(text: 'Login Success', text2: ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/success.png",
                height: 300, width: Get.size.width),
            SizedBox(
              height: 40,
            ),
            Text(
              'Login Success',
              style: TextStyle(
                  fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 70,
            ),
            commonButton(
                text: 'Back to Home', press: () => Get.toNamed('/home-page'))
          ],
        ),
      ),
    );
  }
}
