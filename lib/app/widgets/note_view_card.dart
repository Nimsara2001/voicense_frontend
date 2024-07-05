
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/note_model.dart';
import 'package:voicense_frontend/app/modules/lec_note/views/lec_note_view.dart';
import 'package:voicense_frontend/app/widgets/popup_menu_btn.dart';
import 'package:voicense_frontend/app/util/theme.dart';
class RecentNoteCardController extends GetxController{

  String _removeSymbols(String text) {
    final regex = RegExp(r'[^\w\s]'); // Matches characters except letters, numbers, and whitespace
    return text.replaceAll(regex, '');
  }
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }

}
class RecentNoteCardView extends GetView<RecentNoteCardController>{
  Note note;
  RecentNoteCardView({required this.note});

  @override
  Widget build(BuildContext context) {

    RecentNoteCardController controllerNote = Get.put(RecentNoteCardController());
     return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15, left: 5, right: 5),
        width: double.infinity,
        height: 109,
        // Adjusted height to accommodate the additional content
        decoration: BoxDecoration(
          color: myNoteCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Get.to(() => LecNoteView(), arguments: note);
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
                          note.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          note.createdDate.toString(),
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    const Spacer(),
                    PopupMenuBtn(note.id) //here we should give note_id instead title

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
                    child: Text(controllerNote._removeSymbols(note.content),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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