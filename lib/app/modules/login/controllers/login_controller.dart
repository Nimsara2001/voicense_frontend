import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voicense_frontend/app/data/user_account_storage.dart';
// import 'package:voicense_frontend/app/modules/home/views/home_view.dart';
import 'dart:convert';

import 'package:voicense_frontend/app/modules/common_he/views/common_he_view.dart';
// import 'package:voicense_frontend/app/modules/stu_home/views/stu_home_view.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;
  var isLoading = false.obs;
  String? username;
  String? password;
  final UserAccountStorage _userAccountStorage = Get.put(UserAccountStorage());

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
    super.onClose();
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Please enter your username";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  void checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    isLoading.value = true;

    try {
      await login(usernameController.text, passwordController.text);
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred during authentication',
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.8.100:8000/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
       print(jsonResponse.runtimeType);
       print("//////////////////////////////////////////////////////");
       print(jsonResponse);
       var typeU = jsonResponse['user']['user_type'];
       Get.to(CommonHeView(userType: typeU,));
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to login.');
    }
  }
}