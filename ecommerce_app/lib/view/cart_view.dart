// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/view/widgets/custom_botton.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  List<String> names = <String>[
    'ahmed',
    'ahmed',
    'ahmed',
    'ahmed',
    'ahmed',
  ];
  List<String> images = <String>[
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
    'assets/images/chaire.png',
  ];
  List<int> prices = <int>[
    100,
    200,
    300,
    400,
    500,
  ];
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                CustomText(
                                  text: names[index],
                                  fontSize: 24,
                                ),
                                const SizedBox(height: 5),
                                CustomText(
                                  text: '\$${prices[index].toString()}',
                                  fontSize: 24,
                                  color: kPrimaryColor,
                                ),
                                const SizedBox(height: 25),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF0F0F0),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Row(children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 15),
                                    CustomText(text: '1', fontSize: 20),
                                    SizedBox(width: 15),
                                    Icon(Icons.remove),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: names.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 15);
                },
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'TOTAL',
                      fontSize: 14,
                      alignment: Alignment.topLeft,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: '\$3500',
                      fontSize: 25,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                MainBotton(
                  text: 'CHECKOUT',
                  fontSize: 16,
                  onPressed: () {},
                  txtColor: Colors.white,
                  width: MediaQuery.of(context).size.width * .49,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }   
}
