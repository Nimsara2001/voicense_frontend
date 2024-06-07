import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  // Text controller for email input field
  final emailController = TextEditingController();

  // Observables for loading state and error message
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  // Function to send password reset email
  void sendPasswordResetEmail() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      errorMessage.value = 'Please enter your email address';
      return;
    }

    if (!GetUtils.isEmail(email)) {
      errorMessage.value = 'Please enter a valid email address';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Assume success response from the API
      Get.snackbar(
        'Success',
        'Password reset email sent',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      // Handle error (e.g., network issue, server error)
      errorMessage.value = 'Failed to send reset email. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
