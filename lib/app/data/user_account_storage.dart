import 'package:get/get.dart';

class UserAccountStorage extends GetxController {
  final _userSchema = {}.obs;
  final _token = ''.obs;

  // ignore: invalid_use_of_protected_member
  Map<String, dynamic> get userSchema => _userSchema.value as Map<String, dynamic>;
  set userSchema(Map<String, dynamic> value) => _userSchema.value = value;

  String get token => _token.value;
  set token(String value) => _token.value = value;

  void clearUserData() {
    _userSchema.value = {};
    _token.value = '';
  }
}