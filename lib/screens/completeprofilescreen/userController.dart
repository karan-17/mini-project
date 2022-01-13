import 'package:get/get.dart';
import 'package:miniproject/models/user.dart';


class UserController extends GetxController {
  var user = User().obs;

  void updateUserAddress(String? address) {
    user.update((user) {
      user?.user_address = address;
    });
    print(user.value.user_address);
  }

  String? get getUserAddress {
    return user.value.user_address;
  }

  void updateUserEmail(String? val) {
    user.update((user) {
      user?.user_email = val;
    });
    print(user.value.user_email);
  }

  String? get getUserEmail {
    return user.value.user_email;
  }

  void updateUserFirstName(String? first_name) {
    user.update((user) {
      user?.user_first_name = first_name;
    });
    print(user.value.user_first_name);
  }

  String? get getUserFirstName {
    return user.value.user_first_name;
  }

  void updateUserLastName(String? last_name) {
    user.update((user) {
      user?.user_last_name = last_name;
    });
    print(user.value.user_last_name);
  }

  String? get getUserLastName {
    return user.value.user_last_name;
  }

  void updateUserPassword(String? password) {
    user.update((user) {
      user?.user_password = password;
    });
    print(user.value.user_email);
  }

  String? get getUserPassword {
    return user.value.user_password;
  }

  void updateUserPhoneNumber(int? phone_number) {
    user.update((user) {
      user!.user_phone_number = phone_number;
    });
    print(user.value.user_phone_number);
  }

  int? get getUserPhoneNumber {
    return user.value.user_phone_number;
  }
}
