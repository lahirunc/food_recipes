class RecipesModel {
  int? id;
  String? name;
  String? image;
  String? category;
  List<String>? ingredients;
  String? instructions;

  RecipesModel(
      {this.id,
      this.name,
      this.image,
      this.category,
      this.ingredients,
      this.instructions});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    category = json['category'];
    ingredients = json['ingredients'].cast<String>();
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['category'] = category;
    data['ingredients'] = ingredients;
    data['instructions'] = instructions;
    return data;
  }
}
