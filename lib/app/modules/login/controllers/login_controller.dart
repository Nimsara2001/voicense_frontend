import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voicense_frontend/app/data/user_account_storage.dart';
import 'dart:convert';
import 'package:voicense_frontend/app/modules/lec_home/views/lec_home_view.dart';
import 'package:voicense_frontend/app/modules/stu_home/views/stu_home_view.dart';

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
      final response = await authenticateUser(
        usernameController.text,
        passwordController.text,
      );
      if (response.isSuccessful) {
        if (response.userType == 'student') {
          Get.off(() => StuHomeView());
        } else if (response.userType == 'lecturer') {
          Get.off(() => const LecHomeView());
        } else {
          Get.snackbar(
            'error',
            'Invalid user type',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          response.errorMessage ?? 'Authentication failed',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred during authentication',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<AuthenticationResponse> authenticateUser(
    String username,
    String password,
  ) async {

    final url = Uri.parse('http://192.168.8.111/auth/login');

    final body = jsonEncode({
      'username': username,
      'password': password,
    });
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['message'] == 'success') {
        final userType = data['user_type'];
        final userSchema = data['user'];
        final token = data['token']['access_token'];

        _userAccountStorage.userSchema = userSchema;
        _userAccountStorage.token = token;

        return AuthenticationResponse(isSuccessful: true, userType: userType);
      } else {
        final reason = data['reason'];
        return AuthenticationResponse(
          isSuccessful: false,
          errorMessage: reason,
        );
      }
    } else {
      const errorMessage = 'Authentication failed';
      return AuthenticationResponse(
        isSuccessful: false,
        errorMessage: errorMessage,
      );
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
