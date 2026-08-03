import 'package:flutter/material.dart';
import '../data/models/skill_model.dart';

/// A skill "chip" that smoothly animates both its SIZE (padding/scale)
/// and its COLOR when tapped/selected.
///
/// This satisfies the "size and color transition" requirement on its own,
/// using an [AnimatedContainer] driven purely by the `selected` flag passed
/// in from the controller (see [HomeController.toggleSkill]).
class AnimatedSkillChip extends StatelessWidget {
  final SkillModel skill;
  final bool selected;
  final VoidCallback onTap;

  const AnimatedSkillChip({
    super.key,
    required this.skill,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        // SIZE animation: padding expands when selected.
        padding: EdgeInsets.symmetric(
          horizontal: selected ? 22 : 14,
          vertical: selected ? 14 : 10,
        ),
        // COLOR animation: background lerps between base and selected color.
        decoration: BoxDecoration(
          color: selected ? skill.selectedColor : skill.baseColor,
          borderRadius: BorderRadius.circular(selected ? 24 : 14),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: skill.selectedColor.withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 350),
              style: TextStyle(
                color: Colors.white,
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                fontSize: selected ? 16 : 13,
              ),
              child: Row(
                children: [
                  Icon(
                    skill.icon,
                    color: Colors.white,
                    size: selected ? 22 : 16,
                  ),
                  const SizedBox(width: 6),
                  Text(skill.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
