import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/signup/controllers/signup_controller.dart';

class SignupViewTwo extends GetView<SignupController> {
  final SignupController signupController = Get.put(SignupController());

  SignupViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 20),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF21005D),
                ),
              ),
              const SizedBox(height: 100),
              _inputField(context, signupController),
              const SizedBox(height: 145),
              _backbutton(context, signupController),
              const SizedBox(height:60),
              _buildStepIndicator(),
            ],
          ),
        ),
      ),
    );
  }
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
          color: index == 1 ? const Color(0xFF21005D) : const Color(0xFFD1D1D1),
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }),
  );
}

Widget _inputField(BuildContext context, SignupController controller) {
  // final SignupController controller = Get.put(SignupController());
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
            controller: controller.firstNameController,
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
        const SizedBox(height: 30),
        SizedBox(
          width: 350,
          height: 80,
          child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Last name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            // obscureText: true,
            controller: controller.lastNameController,
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

Widget _backbutton(BuildContext context, SignupController controller) {
  // final SignupController controller = Get.put(SignupController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton.icon(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const ui.Size(140, 50),
        ),
        icon: const Icon(Icons.navigate_before, color: Color(0xFF21005D)),
        label: const Text(
          "Back",
          style: TextStyle(fontSize: 20, color: Color(0xFF21005D)),
        ),
      ),
      const SizedBox(width: 26),
      ElevatedButton.icon(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const SignupViewThree()),
          controller.goToSignup3();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF21005D),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const ui.Size(140, 50),
        ),
        label: const Icon(Icons.navigate_next, color: Colors.white),
        icon: const Text(
          "Next",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ],
  );
}
