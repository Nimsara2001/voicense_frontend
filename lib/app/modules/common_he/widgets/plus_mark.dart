import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/select_module/views/select_module_view.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0, // Set the height
      width: 80.0, // Set the width
      child: FloatingActionButton(
        onPressed: () {
          Get.to(SelectModuleView(user_id: '6638b698f81ffd971fadfa52',));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 0, 93),
        child: const Icon(
          Icons.mic,
          size: 32,
          color: Colors.white,
          weight:10.0,
        ),
      ),
    );
  }
}
