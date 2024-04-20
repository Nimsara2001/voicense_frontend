import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/views/common_he_view.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController usernameController, passwordController;
  var username = '';
  var password = '';

  final List<Map<String, String>> dummyUserData = [
    {'username': 'mihin', 'password': '1234', 'type': 'lec'},
    {'username': 'hansaka', 'password': '123', 'type': 'lec'},
    {'username': 'sahan', 'password': '123', 'type': 'stu'},
    {'username': 'buwa', 'password': '123', 'type': 'stu'},
  ];

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  String? validateUsername(String value) {
    for (var user in dummyUserData) {
      if (user['username'] == value) {
        return null;
      }
    }
    return 'Invalid username';
  }

  String? validatePassword(String value, String username) {
    for (var user in dummyUserData) {
      if (user['username'] == username && user['password'] == value) {
        return null;
      }
    }
    return 'Invalid password';
  }

  void checkLogin(String username) {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    var type = '';
    for (var user in dummyUserData) {
      // Check if the username matches the entered username
      if (user['username'] == username) {
        // If it does, print the type of that user
        type = user['type']!;
        break;
      }
    }

    Get.to(CommonHeView(userType: type));

    loginFormKey.currentState!.save();
  }
}
