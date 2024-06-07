import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;
  var isLoading = false.obs;
  String? username;
  String? password;
  String? serverUsernameError;
  String? serverPasswordError;

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
    if (serverUsernameError != null) {
      return serverUsernameError;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter your password";
    }
    if (serverPasswordError != null) {
      return serverPasswordError;
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
      Uri.parse('http://192.168.8.111/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    final responseData = jsonDecode(response.body);
    if (responseData['message'] == 'invalid' &&
        responseData['reason'] == 'incorrect_username') {
      serverUsernameError = 'Incorrect username';
    }
    if (responseData['message'] == 'invalid' &&
        responseData['reason'] == 'incorrect_password') {
      serverPasswordError = 'Incorrect password';
    }
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      if (jsonResponse['message'] == 'success') {
        String token = jsonResponse['token'];
        await storeToken(token);
      }
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to login.');
    }
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}