import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar({required text, required text2}) {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios_rounded),
    ),
    title: Column(
      children: [
        SizedBox(height: 5,),
        Text(text,
            style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        Text(
          text2,
          style: TextStyle(
              fontFamily: 'Muli',
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    ),
    centerTitle: true,
  );
}
