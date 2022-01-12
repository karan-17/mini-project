import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String? email;
  var password = '';
  bool? remember = false;
  RxList<String> errors = RxList([
    'Enter Valid Email Address',
    'Incorrect Password',
  ]);
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  // @override
  // void onClose(){
  //   emailController.dispose();
  //   passwordController.dispose();
  // }
  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    loginFormKey.currentState!.save();
    return true;
  }

  void checkBox(value) {
    remember = value;
    update();
  }
}
