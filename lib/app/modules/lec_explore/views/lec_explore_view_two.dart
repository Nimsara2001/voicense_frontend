import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_explore/views/lec_explore_view.dart';

class LecExploreViewTwo extends GetView {
  const LecExploreViewTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                searchBox(),
                const SizedBox(
                  height: 20,
                ),
                _moduleName(context),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _container(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _moduleName(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(); // Navigate to the previous page
            },
            icon: const Icon(Icons.arrow_back, size: 25, color: Colors.black),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Module Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ],
  );
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

SizedBox _container(BuildContext context) {
  return SizedBox(
    child: Container(
      width: 360,
      height: 109, // Adjusted height to accommodate the additional content
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 184, 252),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to the next page when the container is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LecExploreView()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Data Structure",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "2024 February 13",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
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
                ],
              ),
              const Expanded(
                child: SizedBox(
                  width: 300,
                  height:
                      60, // Adjusted height to accommodate the additional content
                  child: Text(
                    "Data structures are fundamental concepts in computer science \nthat allow programmers to organize, manage, ",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
