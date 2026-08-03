import 'package:get/get.dart';
import '../../data/models/skill_model.dart';
import '../../data/models/project_model.dart';

class PortfolioController extends GetxController {
  // ----- Personal Info -----
  final String name = 'Prottoy Dhar';
  final String title = 'Aspiring Software Engineer | QA Engineer';
  final String bio =
      'A quick learner on the path to becoming a skilled SQA Engineer. '
      'I love diving into new tools and workflows, and I\'m actively '
      'adapting my testing and development skills around AI-assisted '
      'engineering to build smarter, more reliable software.';
  final String email = 'prottoydhar1@gmail.com';
  final String phone = '01893087277';
  final String facebook = 'https://www.facebook.com/collest.prathy';
  final String profileImage = 'assets/images/profile.jpg';

  // ----- Skills -----
  final List<SkillModel> skills = const [
    SkillModel(name: 'HTML', level: 0.90, category: 'Frontend'),
    SkillModel(name: 'CSS', level: 0.85, category: 'Frontend'),
    SkillModel(name: 'React JS', level: 0.75, category: 'Frontend'),
    SkillModel(name: 'Python', level: 0.70, category: 'Backend'),
    SkillModel(name: 'Django', level: 0.65, category: 'Backend'),
    SkillModel(name: 'Manual Testing', level: 0.85, category: 'QA'),
    SkillModel(name: 'Jira', level: 0.80, category: 'QA'),
    SkillModel(name: 'CI/CD', level: 0.60, category: 'DevOps'),
  ];

  // ----- Projects -----
  final List<ProjectModel> projects = const [
    ProjectModel(
      title: 'Bebsha-Kori',
      description:
          'An AI-powered CRM & business analytics platform that helps '
          'businesses manage customers, track sales, and gain actionable '
          'insights through smart analytics dashboards.',
      tags: ['AI', 'CRM', 'Analytics'],
      icon: '📊',
    ),
    ProjectModel(
      title: 'KhabarKoi',
      description:
          'A full-featured food delivery platform connecting local '
          'restaurants with customers, featuring real-time order tracking '
          'and a smooth checkout experience.',
      tags: ['Food Delivery', 'Full-Stack'],
      icon: '🍽️',
    ),
  ];

  // ----- Animation trigger flag (used by SkillsSection to animate bars in) -----
  final RxBool skillsAnimated = false.obs;

  void triggerSkillsAnimation() {
    if (!skillsAnimated.value) {
      skillsAnimated.value = true;
    }
  }
}
