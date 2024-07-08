
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/note_model.dart';
import 'package:voicense_frontend/app/modules/lec_note/views/lec_note_view.dart';
import 'package:voicense_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:voicense_frontend/app/util/base_client.dart';
import 'package:voicense_frontend/app/widgets/popup_menu_btn.dart';
class RecentNoteCardController extends GetxController{
  Note? note;
  String? userId;
  RecentNoteCardController({this.note,this.userId});

  String _removeSymbols(String text) {
    final regex = RegExp(r'[^\w\s]'); // Matches characters except letters, numbers, and whitespace
    return text.replaceAll(regex, '');
  }

  Future sent_request_to_recent()async{
     try{
      final response = await BaseClient().put('/note//insert_recent', parameters: {'user_id': userId!,"note_id":note!.id});
      if (response.statusCode == 200) {
      var response_messege = (response.body); 
      print(response_messege); // Adjust this function according to your implementation
      // trashed_module_list.assignAll(trashedModules);  // Assuming `trashedModuleList` is defined as an observable list
    } else {
      print('NoteId is not inserted: ${response.statusCode}');
      Get.snackbar('Error', 'Note Id is not inserted', snackPosition: SnackPosition.BOTTOM);
    }
    }
    catch(e){
      print('Error is: $e');
    }
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
    final LoginController controller_from_login = Get.find<LoginController>();
    RecentNoteCardController controllerNote = Get.put(RecentNoteCardController(note: note,userId: controller_from_login.user_id));
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
          onTap: () async {
            Get.to(() => LecNoteView(), arguments: note);
            await controllerNote.sent_request_to_recent();
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