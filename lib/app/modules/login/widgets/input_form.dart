import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/controllers/login_controller.dart';

class InputForm extends StatelessWidget {
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();

    return Form(
      key: loginController.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              prefixIcon: Icon(Icons.person),
            ),
            controller: loginController.usernameController,
            onSaved: (value) {
              loginController.username = value!;
            },
            validator: (value) {
              return loginController.validateUsername(value!);
            },
          ),
          const SizedBox(height: 25),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            controller: loginController.passwordController,
            onSaved: (value) {
              loginController.password = value!;
            },
            validator: (value) {
              return loginController.validatePassword(
                  value!, loginController.usernameController.text);
            },
          ),
          const SizedBox(height: 70),
          ElevatedButton(
            onPressed: () {
              loginController
                  .checkLogin(loginController.usernameController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF21005D),
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Log In",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
