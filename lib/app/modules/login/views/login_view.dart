import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/forget_password/views/forget_password_view.dart';
import 'package:voicense_frontend/app/modules/login/widgets/logo.dart';
import 'package:voicense_frontend/app/modules/login/widgets/signup_nav.dart';
import '../controllers/login_controller.dart';
import '../widgets/input_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.all(24),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Logo(),
              SizedBox(height: 90),
              InputForm(),
              SizedBox(height: 25),
              Text(
                "Forgot Password ?",
              ),
              SignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
