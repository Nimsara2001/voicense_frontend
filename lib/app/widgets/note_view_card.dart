import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_note/views/lec_note_view.dart';

class RecentNoteViewCard extends StatelessWidget {
  final String title;
  final String createdDate;
  final String twoLines;
  const RecentNoteViewCard({ required this.title,required this.createdDate,required this.twoLines,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15, left: 5, right: 5),
        width: double.infinity,
        height: 109,
        // Adjusted height to accommodate the additional content
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 231, 222, 252),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Get.to(() => LecNoteView());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // check this
              children: [
                Row(
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          createdDate,
                          style: const TextStyle(fontSize: 10),
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
                const SizedBox(
                  height: 8,
                ),
                 Expanded(
                  child: SizedBox(
                    width: 300,
                    height:
                        60, // Adjusted height to accommodate the additional content
                    child: Text(
                      twoLines,
                      style:const TextStyle(fontSize: 10),
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
}
