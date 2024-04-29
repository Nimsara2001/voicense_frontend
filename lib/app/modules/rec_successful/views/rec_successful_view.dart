import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rec_successful_controller.dart';

Color myRgbColor = const Color(0xff21005D);

class RecSuccessfulView extends GetView<RecSuccessfulController> {
  const RecSuccessfulView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Recording Successful',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/common-he');
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0, // Use double precision for better layout
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(myRgbColor),
                minimumSize: MaterialStateProperty.all(Size(200.0, 60.0)), // Set desired size
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)), // Optional padding
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))), // Optional rounded corners
              ),
            )

          ],
        ),
      ),
    );
  }
}


