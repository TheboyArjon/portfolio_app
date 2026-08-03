import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/theme_controller.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Obx(() {
      final gradient = themeController.currentGradient;
      return Row(
        children: [
          Container(
            width: 6,
            height: 22,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradient),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }
}
