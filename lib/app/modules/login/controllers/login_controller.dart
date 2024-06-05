import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:voicense_frontend/app/modules/common_he/views/common_he_view.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;

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
    // Make an API call to check if the username exists
    // Return null if the username is valid, otherwise return an error message
    // Implement your validation logic here
    return null;
  }

  String? validatePassword(String value) {
    // Make an API call to authenticate the user with the provided username and password
    // Return null if the password is valid, otherwise return an error message
    // Implement your validation logic here
    return null;
  }

  void checkLogin(String username, String password) async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    try {
      // Make an API call to authenticate the user
      final response = await authenticateUser(username, password);

      if (response.isSuccessful) {
        // Authentication successful
        final userType =
            response.userType; // Assuming the API returns the user type
        Get.to(CommonHeView(userType: "userType"));
      } else {
        // Authentication failed
        Get.snackbar(
          'Error',
          response.errorMessage ??
              'Authentication failed', // Assuming the API returns an error message
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle any exceptions that occur during the API call
      Get.snackbar(
        'Error',
        'An error occurred during authentication',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    loginFormKey.currentState!.save();
  }

  Future<AuthenticationResponse> authenticateUser(
      String username, String password) async {
    final url = http.post(Uri.parse('http://192.168.8.101:8000/auth/login'));
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(url as Uri, body: body);

    if (response.statusCode == 200) {
      // Authentication successful
      final userType = jsonDecode(
          response.body)['user_type']; // Assuming the API returns the user type
      return AuthenticationResponse(isSuccessful: true, userType: userType);
    } else {
      // Authentication failed
      final errorMessage = jsonDecode(response.body)[
          'error_message']; // Assuming the API returns an error message
      return AuthenticationResponse(
          isSuccessful: false, errorMessage: errorMessage);
    }
  }
}

class AuthenticationResponse {
  final bool isSuccessful;
  final String? userType;
  final String? errorMessage;

  AuthenticationResponse({
    required this.isSuccessful,
    this.userType,
    this.errorMessage,
  });
}
