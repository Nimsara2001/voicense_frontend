import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/profile/views/profile_view.dart';

class SearchBarTopController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
}

class SearchBarTop extends GetView<SearchBarTopController> {
  final SearchBarTopController controller = Get.put(SearchBarTopController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 234, 230, 239),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller.searchTextController, // Bind the controller
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          // contentPadding: const EdgeInsets.only(left: 5),
          border: InputBorder.none,
          // ... (rest of decoration properties)
          suffixIcon: IconButton(
            onPressed: () {
              Get.to(ProfileView()); // Use Get.to for navigation
            },
            icon: const Icon(Icons.account_circle),
            iconSize: 32,
          ),
        ),
      ),
    );
  }
}
