class Ingredient {
  final String id;
  final String name;
  final String category;
  final double carbonFootprint; // simulé pour l'empreinte carbone

  Ingredient({
    required this.id,
    required this.name,
    required this.category,
    this.carbonFootprint = 1.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'carbonFootprint': carbonFootprint,
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      carbonFootprint: json['carbonFootprint'] ?? 1.0,
    );
  }
}