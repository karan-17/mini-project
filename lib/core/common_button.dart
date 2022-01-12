import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commonButton({required String text, required press}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: SizedBox(
      height: 50,
      width: Get.size.width,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF374ABE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        child: Text(
          text,
          style:
              TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Muli'),
        ),
      ),
    ),
  );
}
