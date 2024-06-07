import '../controllers/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Enter your email',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.sendPasswordResetEmail(),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text('Send'),
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ForgetPasswordView extends StatefulWidget {
//   const ForgetPasswordView({super.key});

//   @override
//   _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
// }

// class _ForgetPasswordViewState extends State<ForgetPasswordView> {
//   final _emailController = TextEditingController();
//   bool _isLoading = false;
//   String _errorMessage = '';

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _sendPasswordResetEmail() {
//     final email = _emailController.text.trim();

//     if (email.isEmpty) {
//       setState(() {
//         _errorMessage = 'Please enter your email address';
//       });
//       return;
//     }

//     if (!_isValidEmail(email)) {
//       setState(() {
//         _errorMessage = 'Please enter a valid email address';
//       });
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     // Simulate API call
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         _isLoading = false;
//       });
//       // Assume success response from the API
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Password reset email sent'),
//         ),
//       );
//     });
//   }

//   bool _isValidEmail(String email) {
//     // Simple email validation regex
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     return emailRegex.hasMatch(email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Forgot Password',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 24.0),
//             const Text(
//               'Enter your email',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 hintText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: _isLoading ? null : _sendPasswordResetEmail,
//               child: _isLoading
//                   ? const CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     )
//                   : const Text('Send'),
//             ),
//             const SizedBox(height: 16.0),
//             Text(
//               _errorMessage,
//               style: const TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
