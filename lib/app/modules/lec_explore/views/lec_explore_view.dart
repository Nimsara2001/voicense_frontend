import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_explore/views/lec_explore_view_two.dart';
import 'package:voicense_frontend/app/widgets/module_view_card.dart';
import 'package:voicense_frontend/app/widgets/search_bar.dart';
import '../controllers/lec_explore_controller.dart';

class LecExploreView extends GetView<LecExploreController> {
  const LecExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarExplore(),
            OtherNotes(context),
            AddModule(context),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: List.generate(10, (index) {
                  return ModuleViewCard(popup_offset: index % 2 == 0 ? -70 : -5);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget OtherNotes(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {

            },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(370, 60),
            backgroundColor: const Color.fromARGB(255,100, 82, 159),
            foregroundColor: Colors.white,
          ),
          child: const Text(
            "Other Notes",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget AddModule(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Modules",
          style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // Handle the button press here
          },
        ),
      ],
    ),
  );
}

