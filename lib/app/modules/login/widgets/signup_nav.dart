
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signup/views/signup_view.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Get.to(() => SignupView());
          },
          child: const Text("Sign Up"),
        ),
      ],
    );
  }
}

