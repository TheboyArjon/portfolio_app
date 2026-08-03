class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final String icon; // simple label/emoji fallback if no image asset

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.icon,
  });
}
