import 'package:flutter/material.dart';
import 'models/skill_model.dart';
import 'models/project_model.dart';

/// Central place for the portfolio's static content.
/// Edit this file to change the skills, projects, or personal info
/// shown in the app — no need to touch the UI code.
class PortfolioData {
  static const String name = 'Md. Abtah Ul Zawad Arjon';
  static const String role = 'Computer Science Student & Software Builder';
  static const String bio =
      'CS student with a focus on computer vision and full-stack development. '
      'I like turning coursework and side ideas into working, production-style '
      'products — from deep learning pipelines to payment-integrated web apps.';

  static final List<SkillModel> skills = [
    const SkillModel(
      name: 'Flutter',
      icon: Icons.phone_iphone,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFF2196F3),
    ),
    const SkillModel(
      name: 'Python',
      icon: Icons.code,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFFFFC107),
    ),
    const SkillModel(
      name: 'YOLO / CV',
      icon: Icons.camera_alt,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFF9C27B0),
    ),
    const SkillModel(
      name: 'Next.js',
      icon: Icons.web,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFF4CAF50),
    ),
    const SkillModel(
      name: 'Django',
      icon: Icons.storage,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFF0B6E4F),
    ),
    const SkillModel(
      name: 'PostgreSQL',
      icon: Icons.dns,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFF336791),
    ),
    const SkillModel(
      name: 'JavaScript',
      icon: Icons.javascript,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFFF7DF1E),
    ),
    const SkillModel(
      name: 'Operating Systems',
      icon: Icons.memory,
      baseColor: Color(0xFF1E3A5F),
      selectedColor: Color(0xFFFF5722),
    ),
  ];

  static final List<ProjectModel> projects = [
    const ProjectModel(
      title: 'Road Vehicle Detection & Counting',
      subtitle: 'YOLO11 · YOLOv5 · Computer Vision',
      description:
          'Fine-tuned YOLO11 (COCO-pretrained) on a 21-class Bangladeshi traffic '
          'dataset — over 3,000 images and 24,000+ labeled objects covering cars, '
          'buses, rickshaws, CNGs, and more. Benchmarked against a YOLOv5 baseline '
          'using mAP@0.5, precision, recall, and F1, with results written up as a '
          'research paper.',
      tags: ['YOLO11', 'YOLOv5', 'Python', 'Computer Vision'],
      icon: Icons.directions_car_filled,
      accentColor: Color(0xFF9C27B0),
    ),
    const ProjectModel(
      title: 'Marathon Registration Platform',
      subtitle: 'Full-Stack · Local Payments',
      description:
          'Production-oriented event registration site for the Bangladeshi market. '
          'Integrates bKash and Nagad via a payment aggregator, with a carefully '
          'designed database schema, concurrency control to prevent slot '
          'overbooking, and IPN webhook-based payment verification.',
      tags: ['Next.js', 'Django', 'PostgreSQL', 'Payments'],
      icon: Icons.directions_run,
      accentColor: Color(0xFF4CAF50),
    ),
    const ProjectModel(
      title: 'Intelligent CPU Scheduling Advisor',
      subtitle: 'Operating Systems Coursework',
      description:
          'A self-contained web app simulating FCFS, SJF, SRTF, Round Robin, and '
          'Priority Scheduling with an AI-driven recommendation engine. Features '
          'Gantt chart visualization, multi-dimensional scoring, and an '
          'explainable advisor panel comparing algorithms side by side.',
      tags: ['HTML/JS', 'Tailwind CSS', 'Algorithms'],
      icon: Icons.memory,
      accentColor: Color(0xFFFF5722),
    ),
  ];

  static const String github = 'https://github.com/TheboyArjon';
  static const String linkedin = 'https://www.linkedin.com/in/arjonbabo/';
  static const String email = 'arjonbabo5@gmail.com';
}
