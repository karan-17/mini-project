import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlockapp/core/continuebutton.dart';
import 'package:simlockapp/screens/Cart/cart_page.dart';
import 'package:transparent_image/transparent_image.dart';
import '/models/products.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);
  static const routeName = '/product-detail';
  var controller = Get.put(ProductController());

  onPageChanged(int x) {
    controller.updateIndex(x);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F5F9),
        body: Column(
          children: [
            productPreview(),
            productDescription(),
          ],
        ),
      ),
    );
  }

  productPreviewImage(String url) {
    return SizedBox(
      height: Get.size.height * 0.4,
      width: Get.size.width,
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: url,
        fit: BoxFit.contain,
      ),
    );
  }

  productImagePagination(var cont) {
    return Positioned(
      bottom: 10,
      child: SizedBox(
        width: Get.size.width,
        height: 50,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: cont.products_list[0]['images'].length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  cont.updateIndex(index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: cont.selectedIndex.value == index
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: cont.products_list[0]['images'][index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  customAppBar() {
    return Positioned(
      top: 10,
      child: SizedBox(
        width: Get.size.width,
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 33,
                color: Color(0xff454547),
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10000),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 35,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '4.5',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontFamily: 'Muli'),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffffba19),
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  productPreview() {
    return Container(
      height: Get.size.height * 0.4,
      width: Get.size.width,
      child: Stack(
        children: [
          SizedBox(
            height: Get.size.height * 0.4,
            width: Get.size.width,
            child: GetBuilder<ProductController>(
              builder: (cont) {
                return productPreviewImage(
                  cont.products_list[0]['images'][cont.selectedIndex.value],
                );
              },
            ),
          ),
          customAppBar(),
          GetBuilder<ProductController>(
            builder: (cont) {
              return productImagePagination(cont);
            },
          ),
        ],
      ),
    );
  }

  productDescription() {
    return Container(
      height: Get.size.height * 0.6 - Get.mediaQuery.padding.top,
      width: Get.size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                controller.products_list[0]['name'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        controller.products_list[0]['category'] as String,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Muli',
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        '₹${controller.products_list[0]['price']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Muli',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xfff3f5f9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.favorite,
                      // color: Color(0xffdbdadf),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Text(
                controller.products_list[0]['description'] == null
                    ? controller.products_list[0]['showDescription']
                    : controller.products_list[0]['description'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Muli',
                ),
              ),
            ),
            Container(
              height: Get.size.height * 0.1,
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: ContinueButton(
                  text: 'Add To Cart',
                  function: () {
                    Get.toNamed(CartScreen.routeName);
                  },
                ),
              ),
            ),
            // productColors(),
            specification(),
          ],
        ),
      ),
    );
  }

  productColors() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffdcdedf).withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                GetBuilder<ProductController>(builder: (cont) {
                  return Container(
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: cont.products_list[0]['colors'].length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            cont.updateColor(index);
                          },
                          child: Container(
                            height: 38,
                            width: 38,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: index == cont.selectedColor.value
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(
                                      cont.products_list[0]['colors'][index]),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  specification() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      children: [
        Text(
          'Specifications',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        ...(controller.products_list[0]['specifications'] as List).map((e) {
          return Row(
            children: [
              Text(
                '${e['category']} : ',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${e['value']}',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 20,
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
