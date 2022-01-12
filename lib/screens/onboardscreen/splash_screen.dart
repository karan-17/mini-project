import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlockapp/screens/loginscreen/login_home.dart';
import 'package:simlockapp/screens/onboardscreen/splash_controller.dart';
import 'package:simlockapp/core/carousel.dart';
import 'package:simlockapp/core/common_button.dart';

class SplashScreen extends StatelessWidget {
  // static String routeName='/splash';
  @override
  Widget build(BuildContext context) {
    return GetX<SplashController>(
      init: SplashController(),
      builder: (controller) => Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.size.height * 0.6,
                  child: PageView.builder(
                      itemCount: controller.data.length,
                      onPageChanged: (index) {
                        controller.onPageChange(index);
                      },
                      itemBuilder: (context, index) => Data(
                            text: controller.data[index]['text'].toString(),
                            image: controller.data[index]['image'].toString(),
                          )),
                ),
                Container(
                  height: Get.size.height * 0.4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(controller.data.length,
                            (index) => buildDots(index: index)),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      commonButton(
                        text: "Continue",
                        press: () {
                          Get.toNamed('/login-screen');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //animated dots
  AnimatedContainer buildDots({required int index}) {
    final splashController = Get.find<SplashController>();
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: splashController.pageIndex.value == index ? 16 : 6,
      decoration: BoxDecoration(
        color: splashController.pageIndex.value == index
            ? Color(0xff734ABE)
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
