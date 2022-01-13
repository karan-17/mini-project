import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/core/continuebutton.dart';
import 'package:miniproject/core/signuppagefootertext.dart';
import 'package:miniproject/core/signupscreenheadtext.dart';
import 'package:miniproject/core/simpleappbar.dart';
import 'package:miniproject/core/textformfield.dart';
import 'package:miniproject/screens/otpscreen/otpscreen.dart';

import 'userController.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/complete-profile';
  final _myFormKey = GlobalKey<FormState>();
  var userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar('Sign Up'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SignUpPageHeaderText(
                  heading: 'Complete Profile',
                  byLine:
                      'Complete your details or continue\nwith social media'),
            ),
            const SizedBox(height: 30),
            Form(
              key: _myFormKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const ScrollPhysics(),
                children: [
                  textFormField(
                    textInputType: TextInputType.name,
                    validator: (val) {
                      if (val!.isEmpty) return "This field cannot be empty";
                      return null;
                    },
                    onChanged: (val) {
                      _myFormKey.currentState!.validate();
                      userController.updateUserFirstName(val);
                    },
                    labelText: 'First Name',
                    hintText: 'Enter your First Name',
                    icon: Icons.person_outline_rounded,
                    initialValue: userController.user.value.user_first_name,
                  ),
                  const SizedBox(height: 20),
                  textFormField(
                    textInputType: TextInputType.name,
                    onChanged: (val) {
                      _myFormKey.currentState!.validate();
                      userController.updateUserLastName(val);
                    },
                    labelText: 'Last Name',
                    hintText: 'Enter your Last Name',
                    icon: Icons.person_outline_rounded,
                    initialValue: userController.user.value.user_first_name,
                  ),
                  const SizedBox(height: 20),
                  textFormField(
                    hintText: 'Enter your Phone Number',
                    icon: Icons.smartphone,
                    labelText: 'Phone Number',
                    textInputType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) return "This field cannot be empty";
                      if (val.length != 10) return "Enter a valid Phone Number";
                      return null;
                    },
                    onChanged: (val) {
                      _myFormKey.currentState!.validate();
                      userController
                          .updateUserPhoneNumber(int.parse(val.toString()));
                    },
                  ),
                  const SizedBox(height: 20),
                  textFormField(
                    textInputType: TextInputType.streetAddress,
                    validator: (val) {
                      if (val!.isEmpty) return "This field cannot be empty";
                      return null;
                    },
                    onChanged: (val) {
                      _myFormKey.currentState!.validate();
                      userController.updateUserAddress(val);
                    },
                    labelText: 'Address',
                    hintText: 'Enter your Address',
                    icon: Icons.location_on_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ContinueButton(
                text: 'Continue',
                function: () {
                  if (_myFormKey.currentState!.validate())
                    Get.toNamed(OTPScreen.routeName);
                }),
            SignUpPageFooterText(
                'By continuing you confirm that you agree\nwith our Terms and Condition'),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
