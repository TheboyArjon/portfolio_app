import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';
import '../data/portfolio_data.dart';
import '../widgets/animated_avatar.dart';
import '../widgets/animated_nav_bar.dart';
import '../widgets/animated_project_card.dart';
import '../widgets/animated_skill_chip.dart';
import '../widgets/animated_theme_toggle.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    final aboutKey = GlobalKey();
    final skillsKey = GlobalKey();
    final projectsKey = GlobalKey();
    final contactKey = GlobalKey();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Arjon.Dev',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  AnimatedThemeToggle(),
                ],
              ),
              const SizedBox(height: 24),

              // ---------------- About ----------------
              _Section(
                key: aboutKey,
                child: Center(
                  child: Column(
                    children: [
                      const AnimatedAvatar(initials: 'A'),
                      const SizedBox(height: 16),
                      Text(
                        PortfolioData.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        PortfolioData.role,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.7),
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        PortfolioData.bio,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

              // ---------------- Skills ----------------
              _Section(
                key: skillsKey,
                title: 'Skills',
                subtitle: 'Tap a skill to highlight it',
                child: Obx(
                  () => Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(controller.skills.length, (i) {
                      return AnimatedSkillChip(
                        skill: controller.skills[i],
                        selected: controller.selectedSkillIndex.value == i,
                        onTap: () => controller.toggleSkill(i),
                      );
                    }),
                  ),
                ),
              ),

              // ---------------- Projects ----------------
              _Section(
                key: projectsKey,
                title: 'Projects',
                subtitle: 'Tap a project to expand it',
                child: Obx(
                  () => Column(
                    children: List.generate(controller.projects.length, (i) {
                      return AnimatedProjectCard(
                        project: controller.projects[i],
                        expanded: controller.expandedProjectIndex.value == i,
                        onTap: () => controller.toggleProject(i),
                      );
                    }),
                  ),
                ),
              ),

              // ---------------- Contact ----------------
              _Section(
                key: contactKey,
                title: 'Contact',
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _ContactButton(
                      icon: Icons.code,
                      label: 'GitHub',
                      onTap: () => _launch(PortfolioData.github),
                    ),
                    _ContactButton(
                      icon: Icons.business_center,
                      label: 'LinkedIn',
                      onTap: () => _launch(PortfolioData.linkedin),
                    ),
                    _ContactButton(
                      icon: Icons.email,
                      label: 'Email',
                      onTap: () => _launch(PortfolioData.email),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedNavBar(
        sectionKeys: [aboutKey, skillsKey, projectsKey, contactKey],
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _Section extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;

  const _Section({super.key, this.title, this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 12),
              child: Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
            )
          else if (title != null)
            const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: _pressed ? 24 : 18,
          vertical: _pressed ? 16 : 12,
        ),
        decoration: BoxDecoration(
          color: _pressed
              ? theme.colorScheme.primary
              : theme.colorScheme.primary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: _pressed ? 20 : 18,
              color: _pressed ? Colors.white : theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: TextStyle(
                color: _pressed ? Colors.white : theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
