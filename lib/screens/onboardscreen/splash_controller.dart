import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashController extends GetxController{
  RxInt pageIndex = RxInt(0);
  RxInt index = RxInt(0);
  RxList<Map<String, String>> data = RxList([
    {
      "text": 'Welcome to SimLock, Let\'s shop!',
      "image": 'assets/images/splash_1.png',
    },
    {
      "text": 'Helping people connect with stores across India',
      "image": 'assets/images/splash_2.png',
    },
    {
      "text": 'Showing the easy way to shop \nStay at home with us',
      "image": 'assets/images/splash_3.png',
    }
  ]
  );
  void onPageChange(index){
    print(index);
    pageIndex.value=index;
  }
}