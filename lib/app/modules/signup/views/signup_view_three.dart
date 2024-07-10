// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/signup/controllers/signup_controller.dart';

class SignupViewThree extends GetView<SignupController> {
  final String firstName;
  final String lastName;

  const SignupViewThree({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find<SignupController>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF21005D),
                  ),
                ),
                const SizedBox(height: 100),
                _inputField(context, controller),
                const SizedBox(height: 135),
                _backbutton(context, controller),
                const SizedBox(height:60),
                _buildStepIndicator(),
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 80,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: index == 2 ? const Color(0xFF21005D) : const Color(0xFFD1D1D1),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }

  Widget _inputField(BuildContext context, SignupController controller) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            controller: controller.usernameController,
            validator: (value) => controller.validateUsername(value!),
            onChanged: (value) => controller.username.value = value,
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            controller: controller.passwordController,
            validator: (value) => controller.validatePassword(value!),
            onChanged: (value) => controller.password.value = value,
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Confirm Password",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            controller: controller.confirmPasswordController,
            validator: (value) => controller.validateConfirmPassword(value!),
            onChanged: (value) => controller.confirmPassword.value = value,
          ),
        ],
      ),
    );
  }

  Widget _backbutton(BuildContext context, SignupController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => Get.back(),
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SignupViewTwo()),
          // ),
          style: ElevatedButton.styleFrom(
            // ... (same styling as before)
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(140, 50),
          ),
          icon: const Icon(Icons.navigate_before, color: Color(0xFF21005D)),
          label: const Text(
            "Back",
            style: TextStyle(fontSize: 20, color: Color(0xFF21005D)),
          ),
        ),
        const SizedBox(width: 29),
        Obx(
          () => ElevatedButton(
            onPressed: controller.isValidForm()
                ? () {
                    controller.signUpUser();
                  }
                : null,
            // Get.to(() => const SignupViewFour());

            // =>
            // Get.to(() => const SignupViewFour()),

            // Always navigate
            style: ElevatedButton.styleFrom(
              // ... (same styling as before)
              backgroundColor: const Color(0xFF21005D),
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              minimumSize: const Size(140, 50),
            ),
            child: const Text(
              "Finish",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
