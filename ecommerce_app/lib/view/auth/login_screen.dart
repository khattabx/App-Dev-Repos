import 'package:ecommerce_app/core/viewModel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constant.dart';
import '/view/widgets/custom_botton.dart';
import '/view/widgets/custom_text.dart';
import '/view/widgets/custom_text_field.dart';
import '/view/widgets/social_botton.dart';

class LoginScreen extends GetView<AuthViewModel> {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(text: 'Welcome,', fontSize: 30),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                    child: const CustomText(
                      text: 'Sign Up',
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: kSmallTitleColor,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 20),
              const CustomText(
                text: 'Forgot Password?',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              const SizedBox(height: 25),
              MainBotton(
                text: 'SIGN IN',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    controller.signInWithEmailAndPassword();
                  }
                },
                width: double.infinity,
                txtColor: Colors.white,
              ),
              const SizedBox(height: 20),
              const CustomText(text: '-OR-', fontSize: 14),
              const SizedBox(height: 40),
              SocialBotton(
                image: 'assets/images/google.png',
                text: 'Sign In with Google',
                onPressed: () {
                  controller.googleSignInMethod();
                },
              ),
              const SizedBox(height: 20),
              SocialBotton(
                image: 'assets/images/facebook.png',
                text: 'Sign In with Facebook',
                onPressed: () {
                  controller.facebookSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
