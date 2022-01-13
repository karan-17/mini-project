import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/core/common_button.dart';
import 'package:miniproject/screens/otpscreen/otpscreen.dart';
import 'package:miniproject/screens/signupscreen/signupscreen.dart';

import '../../../core/customAppBar.dart';
import 'for_pass_controller.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName= '/forget-password';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
        init: ForgotController(),
        builder: (controller) => Scaffold(
              appBar: customAppBar(text: 'Forgot Password', text2: ''),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text('Forgot Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Please enter your email and we will send you a link to return to your account.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 15,
                                color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          initialValue: controller.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: "Email",
                            hintText: "Enter your email",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            suffixIcon: Icon(Icons.mail_outline_outlined),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Required';
                            }
                            if (!value.isEmail) {
                              return 'Enter Valid Email';
                            }
                          },
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        commonButton(text: 'Continue', press: () {
                          Get.toNamed(OTPScreen.routeName);
                        }),
                        SizedBox(
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(SignUpScreen.routeName);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ));
  }
}
