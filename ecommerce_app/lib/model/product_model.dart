// ignore_for_file: unnecessary_null_comparison

// import 'package:ecommerce_app/utils/extenstion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  late String productId, name, image, description, sized, price;
  Color? color;
  ProductModel(
    this.name,
    this.image,
    this.description,
    this.color,
    this.sized,
    this.price,
    this.productId,
  );

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    // color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }
  toJason() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
