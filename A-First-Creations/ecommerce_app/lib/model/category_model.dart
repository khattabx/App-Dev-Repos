// ignore_for_file: unnecessary_null_comparison

class CategoryModel {
  String? name;
  String? image;

  CategoryModel({this.name, this.image});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }

  tojson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
