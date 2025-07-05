// ignore_for_file: unnecessary_null_comparison, unused_element

class UserModel {
  late String userId;
  late String? name;
  late String? email;
  String? pic;

  UserModel({
    required this.userId,
    this.name,
    this.email,
    this.pic,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
