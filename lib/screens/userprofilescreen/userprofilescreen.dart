import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  static const routeName = "/user-profile";

  final list = [
    {
      'name': 'My Account',
      'icon': Icons.person_outline_rounded,
    },
    {
      'name': 'Notifications',
      'icon': Icons.notifications_none_rounded,
    },
    {
      'name': 'Settings',
      'icon': Icons.help_outline_rounded,
    },
    {
      'name': 'Help Center',
      'icon': Icons.help_outline_rounded,
    },
    {
      'name': 'Log Out',
      'icon': Icons.logout_rounded,
    },
  ];

  var appBar = AppBar(
    title: Text(
      'Profile',
      style: TextStyle(
        color: Color(0xff888888),
        fontFamily: 'Muli',
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getUserPhoto(),
            ...list.map((e) {
              return getButton(e['name'] as String, e['icon'] as IconData);
            }).toList(),
          ],
        ),
      ),
    );
  }

  getUserPhoto() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: Get.size.height * 0.25,
          width: double.infinity,
        ),
        Container(
          height: Get.size.height * 0.2,
          width: Get.size.height * 0.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Get.size.height * 0.2),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://images.unsplash.com/photo-1551847812-f815b31ae67c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: ((Get.size.width / 2) - 45 - (Get.size.height * 0.1 / 2)),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff3f5f5),
            ),
            child: Icon(Icons.camera_alt_outlined, color: Color(0xff8c8e90)),
          ),
        ),
      ],
    );
  }

  getButton(String name, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xfff3f5f6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Color(0xff7f8183),
                    fontSize: 20,
                    fontFamily: 'Muli',
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
