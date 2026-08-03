import 'package:flutter/material.dart';

/// Simple data model representing one portfolio project.
class ProjectModel {
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final IconData icon;
  final Color accentColor;
  final String? link;

  const ProjectModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    required this.icon,
    required this.accentColor,
    this.link,
  });
}
