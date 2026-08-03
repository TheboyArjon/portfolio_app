import 'package:flutter/material.dart';

/// Simple data model representing one skill / technology chip.
class SkillModel {
  final String name;
  final IconData icon;
  final Color baseColor;
  final Color selectedColor;

  const SkillModel({
    required this.name,
    required this.icon,
    required this.baseColor,
    required this.selectedColor,
  });
}
