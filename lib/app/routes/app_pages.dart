import 'package:get/get.dart';

import 'package:voicense_frontend/app/modules/common_he/bindings/common_he_binding.dart';
import 'package:voicense_frontend/app/modules/common_he/views/common_he_view.dart';
import 'package:voicense_frontend/app/modules/lec_explore/bindings/lec_explore_binding.dart';
import 'package:voicense_frontend/app/modules/lec_explore/views/lec_explore_view.dart';
import 'package:voicense_frontend/app/modules/lec_home/bindings/lec_home_binding.dart';
import 'package:voicense_frontend/app/modules/lec_home/views/lec_home_view.dart';
import 'package:voicense_frontend/app/modules/lec_note/bindings/lec_note_binding.dart';
import 'package:voicense_frontend/app/modules/lec_note/views/lec_note_view.dart';
import 'package:voicense_frontend/app/modules/lec_record/bindings/lec_record_binding.dart';
import 'package:voicense_frontend/app/modules/lec_record/views/lec_record_view.dart';
import 'package:voicense_frontend/app/modules/login/bindings/login_binding.dart';
import 'package:voicense_frontend/app/modules/login/views/login_view.dart';
import 'package:voicense_frontend/app/modules/profile/bindings/profile_binding.dart';
import 'package:voicense_frontend/app/modules/profile/views/profile_view.dart';
import 'package:voicense_frontend/app/modules/select_module/bindings/select_module_binding.dart';
import 'package:voicense_frontend/app/modules/select_module/views/select_module_view.dart';
import 'package:voicense_frontend/app/modules/signup/bindings/signup_binding.dart';
import 'package:voicense_frontend/app/modules/signup/views/signup_view.dart';
import 'package:voicense_frontend/app/modules/stu_explore/bindings/stu_explore_binding.dart';
import 'package:voicense_frontend/app/modules/stu_explore/views/stu_explore_view.dart';
import 'package:voicense_frontend/app/modules/stu_home/bindings/stu_home_binding.dart';
import 'package:voicense_frontend/app/modules/stu_home/views/stu_home_view.dart';
import 'package:voicense_frontend/app/modules/stu_note/bindings/stu_note_binding.dart';
import 'package:voicense_frontend/app/modules/stu_note/views/stu_note_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  
  static const INITIAL = Routes.LEC_RECORD;


  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LEC_HOME,
      page: () => LecHomeView(),
      binding: LecHomeBinding(),
    ),
    GetPage(
      name: _Paths.LEC_EXPLORE,
      page: () => LecExploreView(),
      binding: LecExploreBinding(),
    ),
    GetPage(
      name: _Paths.LEC_NOTE,
      page: () => LecNoteView(),
      binding: LecNoteBinding(),
    ),
    GetPage(
      name: _Paths.STU_HOME,
      page: () => StuHomeView(),
      binding: StuHomeBinding(),
    ),
    GetPage(
      name: _Paths.STU_EXPLORE,
      page: () => StuExploreView(),
      binding: StuExploreBinding(),
    ),
    GetPage(
      name: _Paths.STU_NOTE,
      page: () => StuNoteView(),
      binding: StuNoteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LEC_RECORD,
      page: () => LecRecordView(),
      binding: LecRecordBinding(),
    ),
    GetPage(
      name: _Paths.COMMON_HE,
      page: () => CommonHeView(),
      binding: CommonHeBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_MODULE,
      page: () => SelectModuleView(),
      binding: SelectModuleBinding(),
    ),
  ];
}
