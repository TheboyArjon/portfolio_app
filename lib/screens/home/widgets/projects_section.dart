import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/portfolio_controller.dart';
import '../../../core/controllers/theme_controller.dart';
import '../../../data/models/project_model.dart';
import 'section_title.dart';

/// ANIMATION #4 (bonus): Size + Color transition
/// Each project card scales up and its background color shifts toward
/// the app's gradient accent when pressed.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.find<PortfolioController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Projects'),
          const SizedBox(height: 16),
          ...controller.projects
              .map((p) => _ProjectCard(project: p))
              .toList(),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final theme = Theme.of(context);

    return Obx(() {
      final gradient = themeController.currentGradient;

      return GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(_pressed ? 22 : 18),
          transform: Matrix4.identity()..scale(_pressed ? 1.03 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _pressed
                ? gradient.first.withOpacity(0.12)
                : theme.colorScheme.surface,
            border: Border.all(
              color: _pressed
                  ? gradient.first.withOpacity(0.6)
                  : Colors.transparent,
              width: 1.4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_pressed ? 0.1 : 0.05),
                blurRadius: _pressed ? 18 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _pressed ? 52 : 46,
                height: _pressed ? 52 : 46,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradient),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.project.icon,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.project.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: widget.project.tags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: gradient.first.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: gradient.first,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
