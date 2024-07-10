// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';
import '../controllers/signup_controller.dart';

// enum Selection { none, student, lecturer }

class SignupView extends GetView<SignupController> {
  // final _selection = Selection.none.obs;

  @override
  final SignupController controller = Get.put(SignupController());

  SignupView({super.key}); // Use Rx variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF21005D),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  _selectionField(context),
                  const SizedBox(height: 120),
                  _backButton(context),
                  const SizedBox(height:60),
                  _buildStepIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 80,
          height: 4,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: index == 0 ? Color(0xFF21005D) : Color(0xFFD1D1D1),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }

  Widget _selectionField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => _selectionCard(
            text: "Lecturer",
            onTap: () => controller.updateSelection(Selection.lecturer),
            isSelected:
                controller.selectedSelection.value == Selection.lecturer,
          ),
        ),
        const SizedBox(height: 50),
        Obx(
          () => _selectionCard(
            text: "Student",
            onTap: () => controller.updateSelection(Selection.student),
            isSelected: controller.selectedSelection.value == Selection.student,
          ),
        ),
      ],
    );
  }

  Widget _selectionCard({
    required String text,
    required Function() onTap,
    required bool isSelected,
  }) {
    const double borderRadiusValue = 10.0; // Constant borderRadius for all cards
    return Card(
      elevation: isSelected ? 5 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        side: BorderSide(
          color: Color(0xFF21005D),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue), // Apply borderRadius to ClipRRect
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: isSelected ? Color(0xFF21005D) : Colors.white,
            child: SizedBox(
              width: 350,
              height: 65,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: isSelected ? Colors.white : Color(0xFF21005D),
                  ),
                ),
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
          icon: const Icon(Icons.navigate_before, color: Color(0xFF21005D)),
          label: const Text(
            "Back",
            style: TextStyle(fontSize: 20, color: Color(0xFF21005D)),
          ),
        ),
        SizedBox(width: 26), // Add spacing between buttons (optional
        Obx(
              () => ElevatedButton(
            onPressed: controller.selectedSelection.value != Selection.none
                ? () => controller.goToSignup2()
                : null, // Disable "Next" if no selection is made
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.selectedSelection.value != Selection.none
                  ? const Color(0xFF21005D)
                  : null, // Disable button styling if not selected
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              minimumSize: const Size(140, 50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Use min to prevent the Row from expanding
              children: const [
                Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(Icons.navigate_next, color: Colors.white),
              ],
            ),
          ),
        )
      ],
    );
  }
}
