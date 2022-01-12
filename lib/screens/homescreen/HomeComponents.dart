import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simlockapp/screens/Cart/cart_controller.dart';
import 'package:simlockapp/screens/homescreen/home_screen_controller.dart';
import 'package:simlockapp/screens/homescreen/offers.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width * 0.6,
      height: Get.size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search Product",
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Get.size.width * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
class CounterIconBtn extends StatelessWidget {
  final String svgSrc;
  final GestureTapCallback press;
  final int itemNo;
  const CounterIconBtn({Key? key, required this.svgSrc, required this.press, this.itemNo=0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(Get.size.width * 0.01),
            height: Get.size.height * 0.05,
            width: Get.size.width * 0.1,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if(itemNo!=0)
            Positioned(
              top: -5,
              right: 0,
              child: Container(
                height: Get.size.height * 0.045,
                width: Get.size.width * 0.045,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      height: 1,
                      fontSize: Get.size.width * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class HomeBar extends StatelessWidget {
  const HomeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchField(),
        CounterIconBtn(
          svgSrc: "assets/icons/CartIcon.svg",
          press: () {
            Get.toNamed('/cart-page');
          },
          itemNo: 0,
        ),
        CounterIconBtn(
          svgSrc: "assets/icons/Bell.svg",
          itemNo: 3,
          press: () {},
        ),
      ],
    );
  }
}

class DiscountCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20 ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
          TextSpan(
              text: "A summer surprise\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text: "Cashback 20%",
                    style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                )
              ]
          )
      ),
    );
  }
}


class Categories extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            controller.categories.length,
                (index) => CategoryCard(
                icon: controller.categories[index]["icon"],
                text: controller.categories[index]["text"],
                press: () {
                  Get.back();
                },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon, text;
  final GestureTapCallback press;

  const CategoryCard(
      {
        Key? key,
        required this.icon,
        required this.text,
        required this.press
      }
      )
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(Get.size.width * 0.16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CircleAvatar(child: SvgPicture.asset(icon,color: Colors.blueGrey,), radius: 24,),
              ),
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const SectionTitle(
      {
        Key? key,
        required this.text,
        required this.press
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Colors.black),
          ),
          GestureDetector(onTap:press ,child: Text("See more", style: TextStyle(color: Colors.black45, fontSize: 16),))
        ],
      ),
    );
  }
}

Column specialOffers(HomeController controller) {
  return Column(
    children: [
      SectionTitle(
        text: "Special for you",
        press: () {},
      ),
      SizedBox(
        height: 25,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            OfferCards(
                category: controller.brandcategories[0]["category"].toString(),
                image: controller.brandcategories[0]["image"].toString(),
                brandNo: controller.brandcategories[0]["brandNo"].toString(),
                press: (){}
            ),
            OfferCards(
                category: controller.brandcategories[1]["category"].toString(),
                image: controller.brandcategories[1]["image"].toString(),
                brandNo: controller.brandcategories[1]["brandNo"].toString(),
                press: (){}
            ),
            SizedBox(
              width: 20,
            ),
            // OfferCards(
            //     category: controller.categories[2]["category"],
            //     image: controller.categories[2]["image"],
            //     brandNo: controller.categories[2]["brandNo"],
            //     press: (){}
            // ),
          ],
        ),
      ),
    ],
  );
}
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.press,
  }) : super(key: key);
  final double width, aspectRatio;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
  final ProductController controller = Get.put(ProductController());
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(controller.demoProducts[0].images[0]),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              controller.demoProducts[0].title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${controller.demoProducts[0].price}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    child: InkWell(
                      onTap: press,
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                        )
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


