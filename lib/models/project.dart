class Project {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String imageUrl;
  final String infoUrl;
  final String loginUrl;

  Project({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.techStack,
    required this.imageUrl,
    required this.infoUrl,
    required this.loginUrl,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String? ?? 'Software Product',
      description: json['description'] as String,
      techStack: List<String>.from(json['techStack'] ?? []),
      imageUrl: json['imageUrl'] as String,
      infoUrl: json['infoUrl'] as String? ?? '',
      loginUrl: json['loginUrl'] as String? ?? '',
    );
  }
}
