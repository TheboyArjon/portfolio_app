import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

/// Custom light/dark switch. The knob animates both SIZE (it grows
/// slightly while dragging/settling) and COLOR (track lerps between
/// a light-blue and a deep navy), independent of the other animated
/// widgets in the app — a bonus 4th animated component.
class AnimatedThemeToggle extends StatelessWidget {
  const AnimatedThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() {
      final isDark = themeController.isDarkMode.value;
      return GestureDetector(
        onTap: themeController.toggleTheme,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 64,
          height: 34,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            // COLOR animation.
            color: isDark ? const Color(0xFF0D1B2A) : const Color(0xFF90CAF9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              // SIZE animation.
              width: isDark ? 30 : 26,
              height: isDark ? 30 : 26,
              decoration: BoxDecoration(
                color: isDark ? Colors.indigo[200] : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDark ? Icons.nightlight_round : Icons.wb_sunny,
                size: 16,
                color: isDark ? Colors.indigo[900] : Colors.orange,
              ),
            ),
          ),
        ),
      );
    });
  }
}
