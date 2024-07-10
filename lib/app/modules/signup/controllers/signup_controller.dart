import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voicense_frontend/app/modules/signup/views/signup_view_four.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_three.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_two.dart';
import 'package:flutter/material.dart';

import '../../../util/base_client.dart';

enum Selection { lecturer, student, none }

class SignupController extends GetxController {
  final selectedSelection = Selection.none.obs;
  RxInt currentStep=1.obs;

  void updateSelection(Selection selection) {
    selectedSelection.value = selection;
  }

//   String? selectionToString(Selection selection) {
//   if (selection == Selection.lecturer) {
//     return 'Lecturer';
//   } else if (selection == Selection.student) {
//     return 'Student';
//   } else {
//     return null;
//   }
// }

  void goToSignup2() {
    Navigator.of(Get.context!).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignupViewTwo(), // Replace SignupViewTwo with your target screen class
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset.zero; // End at center
        const curve = Curves.ease; // Define an easing curve

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ));
  }

  String? selectionToString(Selection selection) {
    if (selection == Selection.lecturer) {
      return 'Lecturer';
    } else if (selection == Selection.student) {
      return 'Student';
    } else {
      return null;
    }
  }

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
    } else if (firstName.value.length < 4) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'First name must be at least 4 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (!RegExp(r'^[a-zA-Z]').hasMatch(firstName.value)) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'First name must start with a letter',
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
    } else if (lastName.value.length < 4) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'Last name must be at least 4 characters long',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (!RegExp(r'^[a-zA-Z]').hasMatch(lastName.value)) {
      // Show an error message or snackbar
      Get.snackbar(
        'Error',
        'First name must start with a letter',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Navigator.of(Get.context!).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignupViewThree(firstName: firstNameValue, lastName: lastNameValue), // Replace SignupViewTwo with your target screen class
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset.zero; // End at center
        const curve = Curves.ease; // Define an easing curve

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ));
  }

  final RxString username = RxString('');
  final RxString password = RxString('');
  final RxString confirmPassword = RxString('');

  // Error messages (optional)
  final RxString usernameError = RxString('');
  final RxString passwordError = RxString('');
  final RxString confirmPasswordError = RxString('');

  // Validation methods (example)
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Username cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z]').hasMatch(value)) {
      return 'Username must start with a letter';
    } else if (value.split(' ').length > 1) {
      return 'Username must be a single word';
    }
    return null; // Return null if validation passes
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter and one number';
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

  // Method to check if form is valid (example)
  bool isValidForm() {
    final usernameValid = validateUsername(username.value) == null;
    final passwordValid = validatePassword(password.value) == null;
    final confirmPasswordValid =
        validateConfirmPassword(confirmPassword.value) == null;
    return usernameValid && passwordValid && confirmPasswordValid;
  }

  final count = 0.obs;

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxString firstName = RxString('');
  final RxString lastName = RxString('');

  Future<void> signUpUser() async {
    final url = Uri.parse('$baseUrl/auth/signup');

    final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode({
    //   'username': username.value,
    //   'password': password.value,
    //   'first_name': firstName.value, // Assuming you have a firstName field
    //   'last_name': lastName.value, // Assuming you have a lastName field
    //   'user_type': selectedSelection.value.name, // Convert Selection to string
    // });
    final body = jsonEncode({
      'username': username.value,
      'password': password.value,
      'first_name': firstName.value, // Assuming you have a firstName field
      'last_name': lastName.value, // Assuming you have a lastName field
      'user_type': selectionToString(
          selectedSelection.value), // Convert Selection to string
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
