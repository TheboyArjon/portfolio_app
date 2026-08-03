import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controls the app's light/dark theme state.
/// Kept as its own controller (rather than jammed into HomeController)
/// because theme is truly app-wide / cross-page state.
class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
