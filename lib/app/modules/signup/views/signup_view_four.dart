import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';
import 'package:voicense_frontend/app/util/theme.dart';

class SignupViewFour extends GetView {
  const SignupViewFour({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _check_circle_done(context),
                const SizedBox(
                  height: 10,
                ),
                _text_success(context),
                const SizedBox(
                  height: 170,
                ),
                _login(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _check_circle_done(BuildContext context) {
  return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle_outline,
          size: 150,
          color: myPrimaryColor,
        ),
      ]);
}

// ignore: non_constant_identifier_names
Widget _text_success(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Success!",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: myPrimaryColor,
        ),
      ),
    ],
  );
}

Widget _login(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {
          Get.to(() => const LoginView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: myPrimaryColor,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(120, 50),
        ),
        child: const Text(
          "Log In",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ],
  );
}
