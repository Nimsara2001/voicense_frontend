import 'package:get/get.dart';

import 'package:voicense_frontend/app/modules/trashed_items/controllers/popmodule_controller.dart';
import 'package:voicense_frontend/app/modules/trashed_items/controllers/popnote_controller.dart';

import '../controllers/trashed_items_controller.dart';

class TrashedItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopnoteController>(
      () => PopnoteController(),
    );
    Get.lazyPut<PopmoduleController>(
      () => PopmoduleController(),
    );
    Get.lazyPut<TrashedItemsController>(
      () => TrashedItemsController(),
    );
  }
}
