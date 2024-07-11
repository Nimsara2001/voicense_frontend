import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:voicense_frontend/app/widgets/note_view_card.dart';
import 'package:voicense_frontend/app/widgets/home_search_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  final LoginController _controllerfromLogin  = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    final noteCount=_controllerfromLogin.recent_notes.length;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarTop(),
            topic(),
            Expanded(
                child: Image.asset('assets/no_data.png'),// Replace 'path/to/your/image.png' with the actual path to your image

            ),
          ],
        ),
      ),
    );
  }

  Widget topic() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 20, left: 15),
      child: const Text(
        "Recent Notes",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}
