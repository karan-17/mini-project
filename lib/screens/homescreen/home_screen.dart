import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simlockapp/screens/Cart/cart_controller.dart';
import 'package:simlockapp/screens/homescreen/offers.dart';
import 'HomeComponents.dart';
import 'home_screen_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController productcontroller = Get.put(ProductController());
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.size.width * 0.02,
                    vertical: Get.size.height * 0.01),
                child: HomeBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                  children: [
                    SizedBox(
                    height: 25,
                  ),
                  DiscountCard(),
                  SizedBox(
                    height: 20,
                  ),
                  Categories(),
                  SizedBox(
                    height: 25,
                  ),
                  specialOffers(controller),
                  SizedBox(
                    height: 25,
                  ),
                  SectionTitle(text: "Popular Products", press: () {}),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(productcontroller.demoProducts.length,
                            (index) => ProductCard(
                                product: productcontroller.demoProducts[index],
                              press: () {  },
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SectionTitle(text: "Latest Products", press: () {}),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(productcontroller.demoProducts.length,
                                (index) => ProductCard(
                              product: productcontroller.demoProducts[index],
                              press: () {},
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SectionTitle(text: "Top Rated", press: () {}),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(productcontroller.demoProducts.length,
                                (index) => ProductCard(
                              product: productcontroller.demoProducts[index],
                              press: () {  },
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SectionTitle(text: "Top Selling", press: () {}),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(productcontroller.demoProducts.length,
                                (index) => ProductCard(
                              product: productcontroller.demoProducts[index],
                              press: () {  },
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SectionTitle(text: "On Sale", press: () {}),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(productcontroller.demoProducts.length,
                                (index) => ProductCard(
                              product: productcontroller.demoProducts[index],
                              press: () {  },
                            )
                        )
                      ],
                    ),
                  )
                  ]
                  ),
                ),
              )
            ],
          ),
        )
        ),
      );
  }
}



