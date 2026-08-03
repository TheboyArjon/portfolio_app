import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/portfolio_controller.dart';
import '../../../core/controllers/theme_controller.dart';
import '../../../core/theme/app_theme.dart';
import 'theme_toggle_button.dart';

/// ANIMATION #2: Size + Color transition
/// Tapping the avatar grows its ring and cycles its glow color, giving
/// tactile feedback while showcasing an animated color transition.
class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.find<PortfolioController>();
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() {
      final gradient = themeController.currentGradient;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: const ThemeToggleButton(),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutBack,
                width: _expanded ? 148 : 128,
                height: _expanded ? 148 : 128,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _expanded
                      ? AppColors.accentCyan
                      : Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: (_expanded
                              ? AppColors.accentCyan
                              : Colors.black)
                          .withOpacity(0.35),
                      blurRadius: _expanded ? 24 : 10,
                      spreadRadius: _expanded ? 2 : 0,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    controller.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              controller.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              controller.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      );
    });
  }
}
