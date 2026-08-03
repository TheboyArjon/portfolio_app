import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}

const _items = [
  _NavItem(Icons.person, 'About'),
  _NavItem(Icons.star, 'Skills'),
  _NavItem(Icons.work, 'Projects'),
  _NavItem(Icons.mail, 'Contact'),
];

/// Bottom navigation bar whose active pill animates its SIZE and COLOR
/// as the user switches sections — used to scroll the page to the
/// matching section.
class AnimatedNavBar extends StatelessWidget {
  final List<GlobalKey> sectionKeys;

  const AnimatedNavBar({super.key, required this.sectionKeys});

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final theme = Theme.of(context);
    return Obx(() {
      final activeIndex = controller.navIndex.value;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_items.length, (index) {
            final selected = activeIndex == index;
            final item = _items[index];
            return GestureDetector(
              onTap: () {
                controller.changeNavIndex(index);
                _scrollTo(sectionKeys[index]);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                padding: EdgeInsets.symmetric(
                  horizontal: selected ? 18 : 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? theme.colorScheme.primary.withOpacity(0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      size: selected ? 22 : 20,
                      color: selected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                    if (selected) ...[
                      const SizedBox(width: 6),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
