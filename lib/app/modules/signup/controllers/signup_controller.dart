import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voicense_frontend/app/modules/signup/views/signup_view_four.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_three.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_two.dart';
import 'package:flutter/material.dart';

enum Selection { lecturer, student, none }

class SignupController extends GetxController {
  final selectedSelection = Selection.none.obs;

  // get emailController => null;

  void updateSelection(Selection selection) {
    selectedSelection.value = selection;
  }

  void goToSignup2() {
    if (selectedSelection.value != Selection.none) {
      Get.to(() => SignupViewTwo());
    }
  }
//   void goToSignup3() {
//   final firstName = firstNameController.text;
//   final lastName = lastNameController.text;

//   if (/* your validation logic */) {
//     Get.to(() => SignupViewThree(firstName: firstName, lastName: lastName));
//   }
// }
  void goToSignup3() {
    final firstNameValue = firstNameController.text.trim();
    final lastNameValue = lastNameController.text.trim();

    firstName.value = firstNameValue;
    lastName.value = lastNameValue;

    // Validate first name
    if (firstName.value.isEmpty) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'Please enter your first name',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (firstName.value.length < 3) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'First name must be at least 3 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Validate last name
    if (lastName.isEmpty) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'Please enter your last name',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (lastName.value.length < 3) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'Last name must be at least 3 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Validation passed, navigate to SignupViewThree
    Get.to(() =>
        SignupViewThree(firstName: firstNameValue, lastName: lastNameValue));
  }

  final RxString username = RxString('');
  final RxString password = RxString('');
  final RxString confirmPassword = RxString('');
  final RxString email = RxString('');

  // Error messages (optional)
  final RxString usernameError = RxString('');
  final RxString passwordError = RxString('');
  final RxString confirmPasswordError = RxString('');
  final RxString emailError = RxString('');

  // Validation methods (example)
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Username cannot be empty';
    }
    return null; // Return null if validation passes
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Confirm Password cannot be empty';
    } else if (value != password.value) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Method to check if form is valid (example)
  bool isValidForm() {
    final usernameValid = validateUsername(username.value) == null;
    final emailValid = validateEmail(email.value) == null;
    final passwordValid = validatePassword(password.value) == null;
    final confirmPasswordValid =
        validateConfirmPassword(confirmPassword.value) == null;
    return usernameValid && emailValid && passwordValid && confirmPasswordValid;
  }

  final count = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxString firstName = RxString('');
  final RxString lastName = RxString('');

  Future<void> signUpUser() async {
    final url = Uri.parse('http://10.0.2.2:8000/auth/signup');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': username.value,
      'password': password.value,
      'email': email.value,
      'first_name': firstName.value, // Assuming you have a firstName field
      'last_name': lastName.value, // Assuming you have a lastName field
      'user_type': selectedSelection.value.name, // Convert Selection to string
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Signup successful
        print('Signup successful: ${response.body}');
        Get.to(() => const SignupViewFour());
        // Navigate to the next screen or show a success message
      } else {
        // Signup failed
        print('Signup failed: ${response.body}');
        Get.snackbar('Error', 'Signup failed: ${response.body}',
            snackPosition: SnackPosition.BOTTOM);
        // Show an error message
      }
    } catch (e) {
      print('Error during signup: $e');
      Get.snackbar('Error', 'Error during signup: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
