class CartProductModel {
  late String name;
  late String productId;
  late String image;
  late int quantity;
  late double price;

  CartProductModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.productId,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'] as String;
    productId = map['productId'] as String;
    image = map['image'] as String;
    quantity = map['quantity'] as int;
    price = (map['price'] is int) ? (map['price'] as int).toDouble() : map['price'] as double;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productId': productId,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
