import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController{
  late TextEditingController searchController;
  String? search;
  List<Map<String, dynamic>> categories = RxList([
    {
      "icon": "assets/icons/Flash Icon.svg",
      "text": "Flash Deal"
    },
    {
      "icon": "assets/icons/Bill Icon.svg",
      "text": "Bill"
    },
    {
      "icon": "assets/icons/Game Icon.svg",
      "text": "Game"
    },
    {
      "icon": "assets/icons/Gift Icon.svg",
      "text": "Daily Gift"
    },
    {
      "icon": "assets/icons/Discover.svg", "text": "More"
    },
  ]);
  RxList<Map<String, String>> brandcategories = RxList([
    {
      "category": 'Smartphones\n',
      "image": 'assets/images/banner1.png',
      "brandNo": "18",
    },
    {
      "category": 'Clothes\n',
      "image": 'assets/images/banner2.png',
      "brandNo": "20",
    },
  ]
  );
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

}