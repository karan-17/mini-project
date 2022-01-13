import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/core/common_button.dart';
import 'package:miniproject/screens/forgot_password/forgot_password.dart';
import 'package:miniproject/screens/loginscreen/login_success._struct.dart';
import 'package:miniproject/screens/loginscreen/socialcard.dart';
import 'package:miniproject/screens/signupscreen/signupscreen.dart';

import '../../core/customAppBar.dart';
import 'login_controller.dart';

class LoginStruct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
        appBar: customAppBar(text: 'Sign In', text2: ''),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Welcome Back',
                  style: TextStyle(
                      fontFamily: 'Muli',
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('Sign in with your email and password',
                  style: TextStyle(
                      fontFamily: 'Muli', fontSize: 15, color: Colors.black54)),
              Text('or continue with social media',
                  style: TextStyle(
                      fontFamily: 'Muli', fontSize: 15, color: Colors.black54)),
              SizedBox(
                height: 30,
              ),
              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(children: [
                    SizedBox(height: 30),
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
                        } else if (!value.isEmail) {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "Password",
                        hintText: "Enter your password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: Icon(Icons.lock),
                        //errorText: controller.validatePassword(controller.password),
                      ),
                      controller: controller.passwordController,
                      onChanged: (value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value!.length < 8) {
                          return controller.errors[1];
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: Color(0xFF374ABE),
                            value: controller.remember,
                            onChanged: (value) {
                              controller.checkBox(value);
                            }),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(ForgotPassword.routeName);
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    commonButton(
                        text: 'Login',
                        press: () {
                          if (controller.checkLogin())
                            Get.toNamed(LoginSuccess.routeName);
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(12.0),
                      height: 40,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialCard(
                            icon: "assets/icons/google-icon.svg",
                            press: () {},
                          ),
                          SocialCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {},
                          ),
                          SocialCard(
                            icon: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
