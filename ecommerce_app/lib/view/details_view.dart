// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/viewModel/cart_viewmodel.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_botton.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontSize: 26,
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(text: 'Size', fontSize: 20),
                                CustomText(text: model.sized, fontSize: 20),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(text: 'Color', fontSize: 20),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: model.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                        text: 'Details',
                        fontSize: 26,
                        alignment: Alignment.topLeft,
                      ),
                      CustomText(
                        text: model.description,
                        fontSize: 20,
                        alignment: Alignment.topLeft,
                        color: const Color.fromARGB(255, 67, 67, 67),
                        height: 1.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    spreadRadius: 0.5,
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'PRICE',
                        fontSize: 14,
                        alignment: Alignment.topLeft,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '\$${model.price.toString()}',
                        fontSize: 25,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewmodel>(
                    init: CartViewmodel(),
                    builder: (controller) => MainBotton(
                      text: 'ADD',
                      fontSize: 18,
                      onPressed: () {
                        controller.addProuduct(
                          CartProductModel(
                            name: model.name,
                            image: model.image,
                            price: double.parse(model.price),
                            quantity: 1, 
                            productId:model.productId,
                          ),
                        );
                      },
                      txtColor: Colors.white,
                      width: MediaQuery.of(context).size.width * .49,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
