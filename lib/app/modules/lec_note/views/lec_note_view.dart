// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../controllers/lec_note_controller.dart';
//
// class LecNoteView extends GetView<LecNoteController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LecNoteView by Mihin'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {
//               Get.toNamed("#");
//             },
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.off("#");
//           },
//         ),
//       ),
//       body: SizedBox.expand( // Fills the entire available space
//         child: Container(
//           color: Colors.white54,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import '../controllers/lec_note_controller.dart';

class LecNoteView extends GetView<LecNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LecNoteView by Mihin'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Get.toNamed("#");
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Use Get.back() for proper navigation
          },
        ),
      ),
      body: SizedBox.expand( // Fills the entire available space
        child: FutureBuilder<String>(
          future: _fetchMarkdownData(), // Replace with your data fetching logic
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final markdownData = snapshot.data!;
              return Markdown(data: markdownData);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            // Display a loading indicator while fetching data
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  // Function to fetch markdown data from an external .md file (replace with your implementation)
  Future<String> _fetchMarkdownData() async {
    // Replace with your logic to read the .md file (e.g., using rootBundle or http calls)
    // Here's an example using rootBundle:
    final response = await rootBundle.loadString('assets/lecture_notes.md');
    print("Response: $response");
    return response;
  }
}
