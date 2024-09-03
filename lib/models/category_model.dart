class Category {
  final String name;
  final String assetPath;
  final List<String> shayaries;

  Category(
      {required this.name, required this.assetPath, required this.shayaries});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      assetPath: json['assetPath'],
      shayaries: List.from(json['shayaries']),
    );
  }
}
