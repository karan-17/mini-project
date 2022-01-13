import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:miniproject/core/continuebutton.dart';
import 'package:miniproject/core/signuppagefootertext.dart';
import 'package:miniproject/core/signupscreenheadtext.dart';
import 'package:miniproject/core/simpleappbar.dart';
import 'package:miniproject/core/textformfield.dart';
import 'package:miniproject/screens/completeprofilescreen/completeprofilescreen.dart';
import 'package:miniproject/screens/completeprofilescreen/userController.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/sign-up';
  final userController = Get.put(UserController());
  var _myFormKey = GlobalKey<FormState>();
  String? _password;
  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar('Sign Up'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignUpPageHeaderText(
                heading: 'Register Account',
                byLine: 'Complete your details or continue\nwith social media'),
            const SizedBox(height: 40),
            Form(
              key: _myFormKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const ScrollPhysics(),
                children: [
                  const SizedBox(height: 20),
                  textFormField(
                    controller: textController,
                    initialValue: userController.user.value.user_email ?? null,
                    onChanged: (val) {
                      userController.updateUserEmail(val);
                    },
                    validator: (val) {
                      if (!(val!.isEmail)) {
                        return "Enter a valid email";
                      }
                      if (val.isEmpty) {
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    hintText: 'Enter your email',
                    icon: Icons.mail_outline_outlined,
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  textFormField(
                    initialValue:
                        userController.user.value.user_password ?? null,
                    onChanged: (val) {
                      userController.updateUserPassword(val);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "This field cannot be empty";
                      } else if (val.length < 8) {
                        return "Password should be atleast 8 characters long";
                      }
                      return null;
                    },
                    hintText: 'Enter your password',
                    icon: Icons.lock_outline,
                    labelText: 'Password',
                    textInputType: TextInputType.text,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  textFormField(
                    initialValue: userController.user.value.user_password,
                    onChanged: (val) {
                      _myFormKey.currentState!.validate();
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "This field cannot be empty";
                      }
                      if (val != userController.user.value.user_password) {
                        return "Password and Confirm Password should be same";
                      }
                      return null;
                    },
                    hintText: 'Re-enter your password',
                    icon: Icons.lock_outline,
                    labelText: 'Confirm Password',
                    textInputType: TextInputType.text,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ContinueButton(
                text: 'Continue',
                function: () {
                  if (_myFormKey.currentState!.validate()) {
                    Get.toNamed(CompleteProfileScreen.routeName);
                  }
                }),
            const SizedBox(height: 30),
            socialMediaCard(),
            SignUpPageFooterText(
                'By continuing you confirm that you agree\nwith our Terms and Condition'),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget socialMediaCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialMediaIconButton('assets/icon/google-icon.png'),
        socialMediaIconButton('assets/icon/facebook-icon.png'),
        socialMediaIconButton('assets/icon/twitter-icon.png'),
      ],
    );
  }

  Widget socialMediaIconButton(String icon) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        padding: const EdgeInsets.all(7),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black12,
        ),
        child: Image.asset(icon));
  }
}
