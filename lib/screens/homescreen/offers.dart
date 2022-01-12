import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferCards extends StatelessWidget {
  final String category, image, brandNo;
  final GestureTapCallback press;
  const OfferCards(
      {Key? key,
      required this.category,
      required this.image,
      required this.brandNo,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        height: Get.size.height * 0.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.0),
                        ]
                      )
                  ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Text.rich(TextSpan(
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: category,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "$brandNo Brands",
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
