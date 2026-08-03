import 'package:get/get.dart';
import '../data/portfolio_data.dart';
import '../data/models/skill_model.dart';
import '../data/models/project_model.dart';

/// Drives all reactive state for the single-page portfolio view:
///  - which bottom-nav section is active (used for the animated indicator)
///  - which skill chip is currently "toggled on" (size + color animation)
///  - which project card is currently expanded (size + color animation)
class HomeController extends GetxController {
  final List<SkillModel> skills = PortfolioData.skills;
  final List<ProjectModel> projects = PortfolioData.projects;

  /// Index of the active bottom navigation section.
  final RxInt navIndex = 0.obs;

  /// Index of the currently selected/highlighted skill chip.
  /// -1 means nothing is selected.
  final RxInt selectedSkillIndex = (-1).obs;

  /// Index of the currently expanded project card.
  /// -1 means all cards are collapsed.
  final RxInt expandedProjectIndex = (-1).obs;

  void changeNavIndex(int index) {
    navIndex.value = index;
  }

  void toggleSkill(int index) {
    selectedSkillIndex.value =
        selectedSkillIndex.value == index ? -1 : index;
  }

  void toggleProject(int index) {
    expandedProjectIndex.value =
        expandedProjectIndex.value == index ? -1 : index;
  }
}
