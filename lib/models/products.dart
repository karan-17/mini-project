import 'package:get/get.dart';

class ProductController extends GetxController {
  var products_list = [].obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectedColor = 0.obs;

  void updateColor(var val) {
    selectedColor.value = val;
    update();
  }

  void updateIndex(var val) {
    selectedIndex.value = val;
    update();
  }

  @override
  void onInit() {
    products_list.value = [
      {
        'name': 'Wireless Controller for PS4™',
        'images': [
          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/master/assets/images/ps4_console_white_1.png',
          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/master/assets/images/ps4_console_white_2.png',
          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/master/assets/images/ps4_console_white_3.png',
          'https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/master/assets/images/ps4_console_white_4.png',
        ],
        'colors': [
          0xffFFFFFF,
          0xff80D0C7,
          0xffFC00FF,
          0xffFFE32C,
        ],
        'showDescription': null,
        'description':
            'Eu fugiat officia ea ex proident laborum laboris ex duis dolore fugiat magna consequat quis. Tempor quis nulla labore aliqua qui laborum ullamco aliqua. Qui non voluptate enim ut enim dolore voluptate aliquip magna occaecat sit exercitation. Nostrud ad pariatur voluptate Lorem eiusmod occaecat ut Lorem eu proident velit cupidatat ullamco.',
        'category': 'Gaming',
        'price': 4999.00,
        'specifications': [
          {
            'category': 'Dimensions',
            'value': '15 x 18 cm',
          },
          {
            'category': 'Weight',
            'value': '250 gm',
          },
        ],
      },
    ];
    super.onInit();
  }
}
