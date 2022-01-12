import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Color(0xffB9B9B9),
        fontFamily: 'Muli',
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
