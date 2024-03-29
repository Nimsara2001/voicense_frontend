import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/select_module/views/select_module_view.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {
        Get.to(SelectModuleView());
      },
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 0, 93),
      child: const Icon(
        Icons.add,
        size: 60,
        color: Colors.white,
      ),
    );
  }
}
