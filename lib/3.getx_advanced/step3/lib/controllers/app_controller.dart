import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var count = 0.obs;

  void increment() => count++;

  void toggleTheme() {
    Get.theme.brightness == Brightness.dark
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
  }

  void toggleLanguage() {
    Get.updateLocale(
      Get.locale == const Locale('en', 'US')
          ? const Locale('ko', 'KR')
          : const Locale('en', 'US'),
    );
  }
}
