import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ThemeController extends GetxController {
  final RxBool isDark = false.obs;

  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  ThemeData get currentTheme => isDark.value ? AppTheme.dark : AppTheme.light;

  List<Color> get currentGradient =>
      isDark.value ? AppColors.gradientDark : AppColors.gradientLight;

  void toggleTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(themeMode);
  }
}
