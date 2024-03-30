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
        title: Text('Data Structure'),
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
            Get.back();
          },
        ),
      ),
      body: SizedBox.expand(
        child: FutureBuilder<String>(
          future: _fetchMarkdownData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final markdownData = snapshot.data!;
              return Markdown(selectable:true, data: markdownData);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }


  Future<String> _fetchMarkdownData() async {
    final response = await rootBundle.loadString('assets/lecture_notes.md');
    return response;
  }
}
