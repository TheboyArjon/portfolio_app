import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/portfolio_controller.dart';
import 'section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.find<PortfolioController>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              controller.bio,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontSize: 14.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
