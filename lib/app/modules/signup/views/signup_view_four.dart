import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';

class SignupViewFour extends GetView {
  const SignupViewFour({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
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
_check_circle_done(context) {
  return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle_outline,
          size: 150,
          color: Color.fromARGB(255, 34, 12, 134),
        ),
      ]);
}

// ignore: non_constant_identifier_names
_text_success(context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Success!",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 42, 8, 87),
        ),
      ),
    ],
  );
}

_login(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF21005D),
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
