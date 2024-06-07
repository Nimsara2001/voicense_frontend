import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/controllers/common_he_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CommonHeController>();


    return NavigationBar(
      selectedIndex: controller.focused_value.value,
      onDestinationSelected: (int index) {
        controller.move_page(index);
      },
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.library_books),
          label: 'Explore',
        ),
      ],
    );
  }
}
