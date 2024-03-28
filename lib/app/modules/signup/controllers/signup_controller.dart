import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';

enum Selection { lecturer, student, none }

class SignupController extends GetxController {
  final selectedSelection = Selection.none.obs;
  void updateSelection(Selection selection) {
    selectedSelection.value = selection;
  }

  void goToSignup2() {
    if (selectedSelection.value != Selection.none) {
      Get.to(() => LoginView());
    }
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

  // Method to check if form is valid (example)
  bool isValidForm() {
    final usernameValid = validateUsername(username.value) == null;
    final passwordValid = validatePassword(password.value) == null;
    final confirmPasswordValid = validateConfirmPassword(confirmPassword.value) == null;
    return usernameValid && passwordValid && confirmPasswordValid;
  }
  
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
