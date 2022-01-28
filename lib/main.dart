import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'screens/Cart/cart_page.dart';
import 'screens/completeprofilescreen/completeprofilescreen.dart';
import 'screens/forgot_password/forgot_password.dart';
import 'screens/homescreen/home_screen.dart';
import 'screens/loginscreen/login_home.dart';
import 'screens/loginscreen/login_success._struct.dart';
import 'screens/onboardscreen/splash_screen.dart';
import 'screens/otpscreen/otpscreen.dart';
import 'screens/productdetailscreen/productdetailscreen.dart';
import 'screens/signupscreen/signupscreen.dart';
import 'screens/userprofilescreen/userprofilescreen.dart';

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
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
        GetPage(name: SignUpScreen.routeName, page: () => SignUpScreen()),
        GetPage(name: ForgotPassword.routeName, page: () => ForgotPassword()),
        GetPage(name: LoginSuccess.routeName, page: () => LoginSuccess()),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(name: HomePage.routeName, page: () => HomePage()),
        GetPage(name: CartScreen.routeName, page: () => CartScreen()),
        GetPage(
            name: CompleteProfileScreen.routeName,
            page: () => CompleteProfileScreen()),
        GetPage(name: OTPScreen.routeName, page: () => OTPScreen()),
        GetPage(name: ProductDetail.routeName, page: () => ProductDetail()),
        GetPage(
            name: UserProfileScreen.routeName, page: () => UserProfileScreen()),
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
        elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
