// ignore_for_file: avoid_unnecessary_containers

import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.onSaved,
    this.validator,
  });
  final String text;
  final String hintText;
  final FormFieldValidator<String>? onSaved;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.black,
            alignment: Alignment.topLeft,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator, 
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: kSmallTitleColor,
                fontSize: 14,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
              ),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
