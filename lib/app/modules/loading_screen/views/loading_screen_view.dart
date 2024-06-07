// loading_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/loading_screen_controller.dart';

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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return ElevatedButton(
              onPressed: () {
                controller.simulateLoading(durationInSeconds: 3);
              },
              child: Text('Start Loading'),
            );
          }
        }),
      ),
    );
  }
}
