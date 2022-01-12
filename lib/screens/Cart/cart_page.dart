import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simlockapp/screens/Cart/cart_controller.dart';
import 'package:simlockapp/screens/Cart/checkoutcard.dart';
import '../../core/customAppBar.dart';
import 'cart_components.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Scaffold(
        appBar: customAppBar(
            text: 'Your Cart', text2: '${controller.demoCarts.length} Items'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemCount: controller.demoCarts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: cartItemCard(controller, index),
            ),
          ),
        ),
        bottomNavigationBar: CheckOutCard(),
      ),
    );
  }

  Dismissible cartItemCard(CartController controller, int index) {
    return Dismissible(
        key: Key(controller.demoCarts[index].product.id.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Spacer(),
              CircleAvatar(
                //foregroundColor: Colors.white.withOpacity(0),
                radius: 20,
                child: SvgPicture.asset('assets/icons/Trash.svg'),
                backgroundColor: Colors.redAccent.withOpacity(0.1),
              )
            ],
          ),
        ),
        onDismissed: (direction) {
          controller.itemNoUpdate(index);
        },
        child: CartItemCard(
          cart: controller.demoCarts[index],
        ));
  }
}


