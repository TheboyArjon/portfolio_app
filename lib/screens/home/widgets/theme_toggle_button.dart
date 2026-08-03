import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/theme_controller.dart';

/// ANIMATION #1: Size + Color transition
/// The pill grows slightly and smoothly shifts color between a warm
/// (light mode) and cool (dark mode) palette when tapped.
class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() {
      final bool isDark = themeController.isDark.value;

      return GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: themeController.toggleTheme,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutCubic,
          width: _pressed ? 74 : 64,
          height: _pressed ? 40 : 34,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFFFE8B8),
            boxShadow: [
              BoxShadow(
                color: (isDark ? Colors.cyanAccent : Colors.orangeAccent)
                    .withOpacity(0.25),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            width: _pressed ? 30 : 26,
            height: _pressed ? 30 : 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? Colors.indigo.shade300 : Colors.orange.shade400,
            ),
            child: Icon(
              isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
