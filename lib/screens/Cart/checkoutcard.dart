import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/common_button.dart';
import 'cart_controller.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Get.size.width * 0.15,
        horizontal: Get.size.width * 0.3,
      ),
      height: Get.size.height * 0.15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ]),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: Get.size.width * 0.4,
                  width: Get.size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text(
                  "Add Voucher Code",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: Get.size.height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text:
                        "\$${controller.demoProducts[0].price + controller.demoProducts[1].price + controller.demoProducts[3].price}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.size.width * 0.1,
                  child: commonButton(text: "Check Out", press: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}