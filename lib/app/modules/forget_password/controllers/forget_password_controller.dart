import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  Future<void> sendPasswordResetEmail() async {
    isLoading.value = true;
    errorMessage.value = '';

    final email = emailController.text.trim();

    final response = await sendPasswordResetRequest(email);

    isLoading.value = false;

    if (response.isSuccessful) {
      Get.snackbar(
        'Success',
        'Password reset email sent successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      errorMessage.value = response.errorMessage!;
    }
  }

  Future<ApiResponse> sendPasswordResetRequest(String email) async {
    final response = await http.post(
      Uri.parse('http://your-backend-url/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['success']) {
        return ApiResponse(isSuccessful: true);
      } else {
        return ApiResponse(
          isSuccessful: false,
          errorMessage:
              responseData['error'] ?? 'Failed to send password reset email.',
        );
      }
    } else {
      return ApiResponse(
        isSuccessful: false,
        errorMessage:
            'Failed to send password reset email. Status code: ${response.statusCode}',
      );
    }
  }
}

class ApiResponse {
  final bool isSuccessful;
  final String? errorMessage;

  ApiResponse({required this.isSuccessful, this.errorMessage});
}
