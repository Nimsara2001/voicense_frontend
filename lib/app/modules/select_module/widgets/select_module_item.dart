import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_record/views/lec_record_view.dart';

class SelectModuleItem extends GetView {
  const SelectModuleItem({super.key, required this.text});

  final String text; // istead text should pass module class object

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ElevatedButton(
          onPressed: () {
            Get.to(() => LecRecordView());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 205, 199, 220),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 18),
          )),
    );
  }
}
