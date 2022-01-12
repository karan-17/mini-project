import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlockapp/screens/Cart/cart_page.dart';
import 'package:simlockapp/screens/homescreen/home_screen.dart';
import 'package:simlockapp/screens/loginscreen/login_home.dart';
import 'package:simlockapp/screens/loginscreen/login_success._struct.dart';
import 'package:simlockapp/screens/onboardscreen/splash_screen.dart';
import 'screens/forgot_password/forgot_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: '/splash-screen',
      getPages: [
        GetPage(name: '/splash-screen', page: () => SplashScreen()),
        GetPage(name: '/forget-password', page: () => ForgotPassword()),
        GetPage(name: '/login-success', page: () => LoginSuccess()),
        GetPage(name: '/login-screen', page: () => LoginScreen()),
        GetPage(name: '/home-page', page: () => HomePage()),
        GetPage(name: '/cart-page', page: () => CartScreen()),
      ],
    );
  }

  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0x7990DD)),
        bodyText2: TextStyle(color: Color(0x374ABE)),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
