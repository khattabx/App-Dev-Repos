import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_botton.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetWidget<AuthViewModel> {
  SignupScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CustomText(text: 'Sign up', fontSize: 30),
              const SizedBox(height: 30),
              CustomTextField(
                text: 'Name',
                hintText: 'Enter Your Name',
                onSaved: (value) {
                  controller.name = value!;
                  return null;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Email',
                hintText: 'Enter Your Email',
                onSaved: (value) {
                  controller.email = value!;
                  return null;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Password',
                hintText: 'Enter Your Password',
                onSaved: (value) {
                  controller.password = value!;
                  return null;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 70),
              MainBotton(
                text: 'SIGN UP',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    controller.createUserWithEmailAndPassword();
                  }
                },
                width: double.infinity,
                txtColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
