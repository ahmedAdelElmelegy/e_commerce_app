class CategoryModel {
  int? id;

  String? image;
  String? name;

  CategoryModel(this.id, this.image, this.name);
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      json['id'],
      json['image'],
      json['name'],
    );
  }
}
