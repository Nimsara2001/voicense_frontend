// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final _selection = Selection.none.obs;
  @override
  final SignupController controller = Get.put(SignupController());

  SignupView({super.key}); // Use Rx variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            _selectionField(context),
            const SizedBox(height: 250),
            _backButton(context),
          ],
        ),
      ),
    );
  }

  Widget _selectionField(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _selectionCard(
          text: "Lecturer",
          onTap: () => _selection.value = Selection.lecturer,
          isSelected: _selection.value == Selection.lecturer,
        ),
        const SizedBox(height: 50),
        _selectionCard(
          text: "Student",
          onTap: () => _selection.value = Selection.student,
          isSelected: _selection.value == Selection.student,
        ),
      ],
    );
  }

  Widget _selectionCard({
    required String text,
    required Function onTap,
    required bool isSelected,
  }) {
    return Card(
      elevation: isSelected ? 3.0 : 0.0, // Add elevation on selection
      shape: RoundedRectangleBorder(
        side: const BorderSide(
            color: Colors.black, width: 1.0), // Keep border black
        borderRadius: BorderRadius.circular(8),
      ),
      // Removed card color
      child: InkWell(
        onTap: () {
          if (text == "Lecturer") {
            controller.updateSelection(Selection.lecturer);
          } else if (text == "Student") {
            controller.updateSelection(Selection.student);
          }
        },
        child: Container(
          color: isSelected
              ? Colors.blue
              : Colors.white, // Change entire card color
          child: SizedBox(
            width: 350,
            height: 63,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          ), // Go back to login check is this want
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(140, 50),
          ),
          icon: const Icon(Icons.navigate_before),
          label: const Text(
            "Back",
            style: TextStyle(fontSize: 20, color: Color(0xFF21005D)),
          ),
        ),
        Obx(
          () => ElevatedButton.icon(
            onPressed: controller.selectedSelection.value != Selection.none
                // ? () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SignupViewTwo()),
                //     )
                ? controller.goToSignup2
                : null, // Disable "Next" if no selection is made
            style: ElevatedButton.styleFrom(
              backgroundColor: _selection.value != Selection.none
                  ? const Color(0xFF21005D)
                  : null, // Disable button styling if not selected
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              minimumSize: const Size(140, 50),
            ),
            label: const Text(
              "Next",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            icon: const Icon(Icons.navigate_next),
          ),
        ),
      ],
    );
  }
}
