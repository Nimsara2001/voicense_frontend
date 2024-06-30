import 'package:get/get.dart';

import 'package:voicense_frontend/app/modules/trashed_items/bindings/trashed_items_binding.dart';
import 'package:voicense_frontend/app/modules/trashed_items/views/trashed_items_view.dart';

import '../modules/common_he/bindings/common_he_binding.dart';
import '../modules/common_he/views/common_he_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lec_note/bindings/lec_note_binding.dart';
import '../modules/lec_note/views/lec_note_view.dart';
import '../modules/lec_record/bindings/lec_record_binding.dart';
import '../modules/lec_record/views/lec_record_view.dart';
import '../modules/loading_screen/bindings/loading_screen_binding.dart';
import '../modules/loading_screen/views/loading_screen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/note_set_of_module/bindings/note_set_of_module_binding.dart';
import '../modules/note_set_of_module/views/note_set_of_module_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rec_successful/bindings/rec_successful_binding.dart';
import '../modules/rec_successful/views/rec_successful_view.dart';
import '../modules/select_module/bindings/select_module_binding.dart';
import '../modules/select_module/views/select_module_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/stu_explore/bindings/stu_explore_binding.dart';
import '../modules/stu_explore/views/stu_explore_view.dart';
import '../modules/stu_home/bindings/stu_home_binding.dart';
import '../modules/stu_home/views/stu_home_view.dart';
import '../modules/stu_note/bindings/stu_note_binding.dart';
import '../modules/stu_note/views/stu_note_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
      page: () => HomeView(),
      binding: LecHomeBinding(),
    ),
    GetPage(
      name: _Paths.LEC_EXPLORE,
      page: () => ExploreView(),
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
      page: () => AudioRecorderView(),
      binding: RecorderBinding(),
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
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
        name: _Paths.REC_SUCCESSFUL,
        page: () => const RecSuccessfulView(),
        binding: RecSuccessfulBinding()),
    GetPage(
      name: _Paths.NOTE_SET_OF_MODULE,
      page: () => NoteSetOfModuleView(),
      binding: NoteSetOfModuleBinding(),
    ),
    GetPage(
      name: _Paths.LOADING_SCREEN,
      page: () => LoadingScreenView(),
      binding: LoadingScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRASHED_ITEMS,
      page: () => TrashedItemsView(),
      binding: TrashedItemsBinding(),
    ),
  ];
}
