class CategoryModel {
  int id;
  String name;
  String image;

  CategoryModel({required this.id, required this.name, required this.image});

  // form json
  factory CategoryModel.fromjson(json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
  // to json
  toJson() {
    return {"id": id, "name": name, "image": image};
  }
}
