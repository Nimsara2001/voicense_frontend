import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view_three.dart';

class SignupViewTwo extends GetView {
  const SignupViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              _inputField(
                  context), // You can access controller data here if needed
              const SizedBox(height: 250),
              _backbutton(context),
            ],
          ),
        ),
      ),
    );
  }
}

_inputField(BuildContext context) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 350,
          height: 80,
          child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "First name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              if (value.length < 5) {
                return 'First name must be at least 5 characters long';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 350,
          height: 80,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Last name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              if (value.length < 5) {
                return 'First name must be at least 5 characters long';
              }
              return null;
            },
          ),
        ),
      ],
    ),
  );
}

_backbutton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupView()),
          );
        },
        style: ElevatedButton.styleFrom(
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
      ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignupViewThree()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF21005D),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(120, 50),
        ),
        label: const Icon(Icons.navigate_next),
        icon: const Text(
          "Next",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ],
  );
}
