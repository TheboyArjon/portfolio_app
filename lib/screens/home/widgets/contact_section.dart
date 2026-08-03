import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/controllers/portfolio_controller.dart';
import '../../../core/controllers/theme_controller.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.find<PortfolioController>();
    final ThemeController themeController = Get.find<ThemeController>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Contact'),
          const SizedBox(height: 16),
          Obx(() {
            final gradient = themeController.currentGradient;
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ContactRow(
                    icon: FontAwesomeIcons.envelope,
                    label: controller.email,
                    onTap: () => _launch('mailto:${controller.email}'),
                  ),
                  const SizedBox(height: 14),
                  _ContactRow(
                    icon: FontAwesomeIcons.phone,
                    label: controller.phone,
                    onTap: () => _launch('tel:${controller.phone}'),
                  ),
                  const SizedBox(height: 14),
                  _ContactRow(
                    icon: FontAwesomeIcons.facebook,
                    label: 'Facebook Profile',
                    onTap: () => _launch(controller.facebook),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
