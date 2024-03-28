import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_home/views/lec_home_view.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final List<Map<String, String>> dummyUserData = [
    {'username': 'h', 'password': '12'},
  ];

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _logo(context),
            const SizedBox(
              height: 25,
            ),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }
}

_logo(context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/voicence_logo.jpg',
          width: 170,
          height: 170,
        ),
      ]);
}

_inputField(BuildContext context) {
  // Controllers to capture the entered username and password
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: usernameController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: "Username",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            if (value.length < 5) {
              return 'Username must be at least 5 characters long';
            }
            return null;
          },
        ),
        const SizedBox(height: 25),
        TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters long';
            }
            return null;
          },
        ),
        const SizedBox(height: 70),
        ElevatedButton(
          onPressed: () {
            // Capture the entered username and password
            String enteredUsername = usernameController.text;
            String enteredPassword = passwordController.text;

            // Check if the entered username and password match the predefined values
            if (enteredUsername == 'hansaka' && enteredPassword == '12345678') {
              // Navigate to the home screen if login is successful
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LecHomeView()),
              );
            } else {
              // Show an error message if login fails
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invalid username or password'),
                ),
              );
            }

            // bool isValidUser = false;
            // var dummyUserData;
            // for (var userData in dummyUserData) {
            //   if (userData['username'] == enteredUsername &&
            //       userData['password'] == enteredPassword) {
            //     isValidUser = true;
            //     break;
            //   }
            // }

            // // Navigate to the home screen if login is successful, else show an error message
            // if (isValidUser) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => LecHomeView()),
            //   );
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('Invalid username or password'),
            //     ),
            //   );
            // }
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

_forgotPassword(context) {
  return TextButton(onPressed: () {}, child: const Text("Forgot password?"));
}

_signup(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Dont have an account? "),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupView()),
          );
        },
        child: const Text("Sign Up"),
      ),
    ],
  );
}
