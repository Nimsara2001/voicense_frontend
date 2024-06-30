// loading_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../lec_note/views/lec_note_view.dart';
import '../controllers/loading_screen_controller.dart';

Color myRgbColor = const Color(0xff21005D);

class LoadingScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoadingScreenController controller = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie loading indicator
                Lottie.asset(
                  'assets/loading_animation.json',
                  fit: BoxFit.fill,
                ),
                // SizedBox(height: 10),
                Text(
                  'Your Note Is Being Generated..\n Please wait',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return ElevatedButton(
              onPressed: () async {
                Get.to(() => LecNoteView(), arguments: await controller.getNote());
              },
              child: Text(
                'View Note',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0, // Use double precision for better layout
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(myRgbColor),
                minimumSize: MaterialStateProperty.all(Size(200.0, 60.0)),
                // Set desired size
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)),
                // Optional padding
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0))), // Optional rounded corners
              ),
            );
          }
        }),
      ),
    );
  }
}
