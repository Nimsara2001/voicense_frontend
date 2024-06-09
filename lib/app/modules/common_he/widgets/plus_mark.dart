import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/select_module/views/select_module_view.dart';

class PlusIcon extends StatelessWidget {
  final String? user_id;
  const PlusIcon({super.key, this.user_id});

  @override
  Widget build(BuildContext context) {
    print("user"+user_id!);
    return SizedBox(
      height: 80.0, // Set the height
      width: 80.0, // Set the width
      child: FloatingActionButton(
        onPressed: () {
          if (user_id != null) {
            Get.to(SelectModuleView(user_id: user_id!));
          } else {
            // Handle the case where user_id is null
            // For example, show an error message
            print('Error: user_id is null');
          }
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
