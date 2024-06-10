import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/module_model.dart';
import 'package:voicense_frontend/app/models/note_model.dart';
import 'package:voicense_frontend/app/util/base_client.dart';

class NoteSetOfModuleController extends GetxController {
  Module module;
  NoteSetOfModuleController(this.module);
  //TODO: Implement NoteSetOfModuleController

  RxList<Note> notes_of_module =<Note>[].obs;

  Future<void> getNotes_request() async {
      try {

        var response_moduleNotes = await BaseClient().post('/module/${module.id}/notes',parameters: {'module_id':module.id}); // check here http method
        if(response_moduleNotes.statusCode==200){
          var noteList = noteFromJson(response_moduleNotes.body);
          for (var note in noteList){
            notes_of_module.add(note);
          }
        }
      } catch(e) {
        // Handle the exception here
        print("Error is : $e");
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
  void onClose() {}
}
