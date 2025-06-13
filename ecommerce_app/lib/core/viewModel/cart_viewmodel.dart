import 'package:ecommerce_app/core/services/database/cart_database.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewmodel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewmodel() {
    getAllProguct();
  }
  getAllProguct() async {
    _loading.value = true;
    var dbHelper = CartDatabase.db;
    await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    update();
  }

  addProuduct(CartProductModel CartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel[i].productId) {
        return;
      } else {
        var dbHelper = CartDatabase.db;
        await dbHelper.insert(CartProductModel);
      }
    }
    update();
  }
}
