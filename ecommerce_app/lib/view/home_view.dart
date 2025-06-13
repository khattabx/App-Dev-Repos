// ignore_for_file: sized_box_for_whitespace

import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/viewModel/home_view_model.dart';
import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'Men',
    's',
    's',
    's',
    's',
  ];
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      /*************/
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              backgroundColor: Colors.white,
            ))
          : Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      _searchTextFormField(),
                      const SizedBox(height: 40),
                      const CustomText(
                        text: 'Categories',
                        fontSize: 18,
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(height: 40),
                      _listViewCategory(),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'Best Selling', fontSize: 18),
                          CustomText(text: 'See all', fontSize: 18),
                        ],
                      ),
                      const SizedBox(height: 30),
                      _listViewProducts(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          controller.categoryModel[index].image as String),
                    )),
                const SizedBox(height: 20),
                CustomText(
                    text: controller.categoryModel[index].name as String,
                    fontSize: 12)
              ],
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 25),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF7F7F7)),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFF7F7F7),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 240,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.topLeft,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 7),
                    CustomText(
                      text: controller.productModel[index].description,
                      alignment: Alignment.topLeft,
                      maxline: 1,
                      fontSize: 16,
                      color: const Color(0xFF929292),
                    ),
                    const SizedBox(height: 7),
                    CustomText(
                      text:
                          '\$${controller.productModel[index].price.toString()}',
                      alignment: Alignment.topLeft,
                      fontSize: 16,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 25),
        ),
      ),
    );
  }
}
