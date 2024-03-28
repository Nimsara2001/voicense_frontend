// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/signup/controllers/signup_controller.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_four.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_two.dart';

class SignupViewThree extends GetView<SignupController> {
  const SignupViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
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
              _backbutton(context),
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
          ),
        ],
      ),
    );
  }

  Widget _backbutton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignupViewTwo()),
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
          onPressed: () =>
              Get.to(() => const SignupViewFour()), // Always navigate
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
