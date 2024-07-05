import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_record/views/lec_record_view.dart';
import 'package:voicense_frontend/app/util/theme.dart';

class SelectModuleItem extends GetView {
  final String? module_id;
  final String? text;
  const SelectModuleItem({
    this.module_id,
    super.key,
    this.text
  });

  // istead text should pass module class object

  @override
  Widget build(BuildContext context) {
    print("module_id...." + module_id!);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ElevatedButton(
          onPressed: () {
            Get.to(() => AudioRecorderView());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: myTrietaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            text!,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 18),
          )),
    );
  }
}
