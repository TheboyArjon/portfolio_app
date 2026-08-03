import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/portfolio_controller.dart';
import '../../../core/controllers/theme_controller.dart';
import 'section_title.dart';

/// ANIMATION #3: Size + Color transition
/// Each skill bar animates its width from 0 -> level (size transition)
/// and simultaneously fades/shifts its fill color using a TweenAnimationBuilder
/// gradient once the section becomes visible.
class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  void initState() {
    super.initState();
    // Trigger animation shortly after this section mounts.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        Get.find<PortfolioController>().triggerSkillsAnimation();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.find<PortfolioController>();
    final ThemeController themeController = Get.find<ThemeController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Skills'),
          const SizedBox(height: 18),
          Obx(
            () => Column(
              children: controller.skills.map((skill) {
                final animated = controller.skillsAnimated.value;
                final gradient = themeController.currentGradient;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            skill.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          Text(
                            '${(skill.level * 100).round()}%',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.color
                                  ?.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final fullWidth = constraints.maxWidth;
                          return Stack(
                            children: [
                              Container(
                                height: 10,
                                width: fullWidth,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surface
                                      .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 900),
                                curve: Curves.easeOutCubic,
                                height: 10,
                                width: animated
                                    ? fullWidth * skill.level
                                    : 0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: gradient),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
