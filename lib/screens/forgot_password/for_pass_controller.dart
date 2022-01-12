import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgotController extends GetxController {
  final GlobalKey<FormState>forgotFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String? email;
  var password='';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  void checkLogin() {
    final isValid = forgotFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgotFormKey.currentState!.save();
  }
}