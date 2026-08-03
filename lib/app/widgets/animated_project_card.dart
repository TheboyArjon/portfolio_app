import 'package:flutter/material.dart';
import '../data/models/project_model.dart';

/// A project card that animates its SIZE (height grows to reveal the full
/// description + tags) and COLOR (border/background shifts to the
/// project's accent color) when expanded.
class AnimatedProjectCard extends StatelessWidget {
  final ProjectModel project;
  final bool expanded;
  final VoidCallback onTap;

  const AnimatedProjectCard({
    super.key,
    required this.project,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        // COLOR animation: background & border lerp toward the project's
        // accent color as it opens.
        decoration: BoxDecoration(
          color: Color.lerp(
            theme.colorScheme.surfaceContainerHighest,
            project.accentColor.withOpacity(0.18),
            expanded ? 1 : 0,
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: expanded
                ? project.accentColor
                : theme.colorScheme.outline.withOpacity(0.2),
            width: expanded ? 2 : 1,
          ),
        ),
        // SIZE animation: implicit height change comes from AnimatedSize
        // wrapping content that grows/shrinks below.
        child: AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: expanded ? 52 : 42,
                      height: expanded ? 52 : 42,
                      decoration: BoxDecoration(
                        color: project.accentColor,
                        borderRadius: BorderRadius.circular(expanded ? 16 : 12),
                      ),
                      child: Icon(project.icon, color: Colors.white,
                          size: expanded ? 28 : 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            project.subtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: project.accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 400),
                      turns: expanded ? 0.5 : 0,
                      child: const Icon(Icons.expand_more),
                    ),
                  ],
                ),
                if (expanded) ...[
                  const SizedBox(height: 14),
                  Text(project.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.tags
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: project.accentColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: project.accentColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
