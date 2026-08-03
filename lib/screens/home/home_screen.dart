import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/contact_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ProfileHeader(),
              AboutSection(),
              SkillsSection(),
              ProjectsSection(),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }
}
