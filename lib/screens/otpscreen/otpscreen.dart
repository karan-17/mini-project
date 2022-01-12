import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simlockapp/core/continuebutton.dart';
import 'package:simlockapp/core/signupscreenheadtext.dart';
import 'package:simlockapp/core/simpleappbar.dart';
import 'package:simlockapp/screens/onboardscreen/splash_screen.dart';

late FocusNode focusNodeOne;
late FocusNode focusNodeTwo;
late FocusNode focusNodeThree;
late FocusNode focusNodeFour;

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);
  static const routeName = '/otp';

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    focusNodeOne = FocusNode();
    focusNodeTwo = FocusNode();
    focusNodeThree = FocusNode();
    focusNodeFour = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    focusNodeOne.dispose();
    focusNodeTwo.dispose();
    focusNodeThree.dispose();
    focusNodeFour.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar('OTP Verification'),
      body: Column(
        children: [
          Center(
            child: SignUpPageHeaderText(
                heading: 'OTP Verification',
                byLine:
                    'We sent your code to +919711697907\nThe code will be expired in 00:29'),
          ),
          Spacer(flex: 2),
          otpTextField(),
          Spacer(flex: 3),
          ContinueButton(
              text: 'Continue',
              function: () {
                Get.toNamed(SplashScreen.routeName);
              }),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'Resend OTP Code',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xffA9A9A9),
                fontFamily: 'Muli',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

Widget otpTextField() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.number,
            cursorHeight: 30,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Muli',
            ),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            focusNode: focusNodeOne,
            onChanged: (input) {
              if (input.length == 1) {
                focusNodeTwo.requestFocus();
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
      const SizedBox(width: 15),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.number,
            cursorHeight: 30,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Muli',
            ),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            focusNode: focusNodeTwo,
            onChanged: (input) {
              if (input.length == 1) {
                focusNodeThree.requestFocus();
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
      const SizedBox(width: 15),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.number,
            cursorHeight: 30,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Muli',
            ),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            focusNode: focusNodeThree,
            onChanged: (input) {
              if (input.length == 1) {
                focusNodeFour.requestFocus();
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
      const SizedBox(width: 15),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.number,
            cursorHeight: 30,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Muli',
            ),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            focusNode: focusNodeFour,
            onChanged: (input) {
              if (input.length == 1) {
                focusNodeOne.requestFocus();
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  );
}
