// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/signup/controllers/signup_controller.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_four.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_two.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              _inputField(context),
              const SizedBox(height: 200),
              _backbutton(context, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    return Form(
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupViewTwo()),
          ),
          style: ElevatedButton.styleFrom(
            // ... (same styling as before)
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(120, 50),
          ),
          icon: const Icon(Icons.navigate_before),
          label: const Text(
            "Back",
            style: TextStyle(fontSize: 20, color: Color(0xFF21005D)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.isValidForm()) {
              Get.to(() => const SignupViewFour());
            } else {
              // show validation errors
            }
          },
          // =>
          // Get.to(() => const SignupViewFour()),

          // Always navigate
          style: ElevatedButton.styleFrom(
            // ... (same styling as before)
            backgroundColor: const Color(0xFF21005D),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(120, 50),
          ),
          child: const Text(
            "Finish",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 203, 230, 252)),
          ),
        )
      ],
    );
  }
}
