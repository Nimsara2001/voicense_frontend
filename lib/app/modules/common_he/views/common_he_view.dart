import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/nav_bar.dart';
import '../controllers/common_he_controller.dart';

class CommonHeView extends GetView<CommonHeController> {
  final String? userType;
  final String? user_id;

  const CommonHeView({
    super.key,
    this.user_id,
    this.userType,
  });


  @override
  Widget build(BuildContext context) {
    print("userType " + userType!);
    print("user_id" + user_id!);
    final CommonHeController controller = Get.put(CommonHeController(userType!,user_id!));
    return Scaffold(
      body:
          Obx(() => controller.bodyViewList[controller.focused_value.value]),
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() => controller.Plus_Null[controller.focused_value.value]),
    );
  }
}
