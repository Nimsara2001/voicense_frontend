import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/nav_bar.dart';
import '../controllers/common_he_controller.dart';

class CommonHeView extends GetView<CommonHeController> {
  final String? userType;

  const CommonHeView({
    super.key,
    this.userType,
  });


  @override
  Widget build(BuildContext context) {
    print("userType " + userType!);
    final CommonHeController controller = Get.put(CommonHeController(userType!));
    return Scaffold(
      body:
          Obx(() => controller.bodyViewList[controller.focused_value.value]),
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() => controller.Plus_Null[controller.focused_value.value]),
    );
  }
}
