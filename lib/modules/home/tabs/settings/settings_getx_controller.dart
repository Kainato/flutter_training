import 'package:get/get.dart';

class SettingsGetxController {
  final RxBool isDarkMode = false.obs;
  final RxString language = 'en'.obs;

  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  void changeLanguage(String lang) {
    language.value = lang;
  }
}