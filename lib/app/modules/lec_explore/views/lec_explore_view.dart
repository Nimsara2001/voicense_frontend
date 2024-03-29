import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_explore/views/lec_explore_view_two.dart';
import '../controllers/lec_explore_controller.dart';

class LecExploreView extends GetView<LecExploreController> {
  const LecExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              searchBox(),
              const SizedBox(
                height: 20,
              ),
              _othernotes(context),
              const SizedBox(
                height: 30,
              ),
              _modulesAdd(context),
              const SizedBox(
                height: 20,
              ),
              _modules(context),
            ]),
          ),
        ],
      ),
    ));
  }
}

searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: const Color.fromARGB(160, 238, 235, 235),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      // onChanged: (value) => _runFilter(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );
}

_othernotes(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(370, 70),
          backgroundColor: const Color.fromARGB(255, 99, 73, 247),
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "Other Notes",
          style: TextStyle(fontSize: 20),
        ),
      )
    ],
  );
}

Widget _modulesAdd(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Modules",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      Container(
        width: 50, // Adjust the width according to your needs
        height: 50, // Adjust the height according to your needs
        decoration: BoxDecoration(
          color:
              const Color.fromARGB(255, 237, 224, 240), // Color of the square
          borderRadius: BorderRadius.circular(
              30), // Adjust the border radius for squareness
        ),
        child: const Icon(
          Icons.add_box,
          size: 30,
          color: Color.fromARGB(255, 58, 56, 56), // Color of the plus icon
        ),
      ),
    ],
  );
}

_modules(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: InkWell(
              // Wrap with InkWell for click handling
              onTap: () {
                // Navigate to the desired page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LecExploreViewTwo()), // Replace with your page class
                );
              },
              child: SizedBox(
                width: 170,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 10.0, right: 0.0, bottom: 0.0),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Database",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: PopupMenuButton<String>(
                            onSelected: (String choice) {
                              // Handle the selected choice
                              if (choice == 'Share') {
                                // Handle share functionality
                              } else if (choice == 'Trash') {
                                // Handle trash functionality
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Share',
                                child: ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Share'),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Trash',
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Trash'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: InkWell(
              // Wrap with InkWell for click handling
              onTap: () {
                // Navigate to the desired page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LecExploreViewTwo()), // Replace with your page class
                );
              },
              child: SizedBox(
                width: 170,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 10.0, right: 0.0, bottom: 0.0),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Database",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: PopupMenuButton<String>(
                            onSelected: (String choice) {
                              // Handle the selected choice
                              if (choice == 'Share') {
                                // Handle share functionality
                              } else if (choice == 'Trash') {
                                // Handle trash functionality
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Share',
                                child: ListTile(
                                  leading: Icon(Icons.share),
                                  title: Text('Share'),
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Trash',
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Trash'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
