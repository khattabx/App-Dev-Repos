// ignore_for_file: avoid_print, unused_local_variable, unnecessary_overrides, prefer_if_null_operators, unnecessary_null_comparison

import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  String? email;
  String? password;
  String? name;

  final Rx<User?> _user = Rx<User?>(null);
  String get user => _user.value?.email ?? '';

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  Future<void> googleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar('Error', 'Google sign-in was cancelled.',
            snackPosition: SnackPosition.TOP, colorText: Colors.black);
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential).then((user) async {
        saveUser(user);
        Get.offAll(HomeView());
        return user;
      });
      print('Google Sign-in successful: ${userCredential.user}');
    } catch (error) {
      Get.snackbar('Error', 'Error occurred during Google sign-in: $error',
          snackPosition: SnackPosition.TOP, colorText: Colors.black);
    }
  }

  Future<void> facebookSignInMethod() async {
    try {
      final LoginResult result = await _facebookAuth.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken?.token ?? '');
        UserCredential userCredential =
            await _auth.signInWithCredential(credential).then((user) async {
          saveUser(user);
          return user;
        });
        print('Facebook Sign-in successful: ${userCredential.user}');
      } else {
        Get.snackbar('Error', 'Facebook sign-in failed: ${result.status}',
            snackPosition: SnackPosition.TOP, colorText: Colors.black);
      }
    } catch (error) {
      Get.snackbar('Error', 'Facebook sign-in failed',
          snackPosition: SnackPosition.TOP, colorText: Colors.black);
      print(error);
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      Get.offAll(HomeView());
    } catch (e) {
      handleAuthError(e);
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      saveUser(userCredential);
      Get.offAll(HomeView());
    } catch (e) {
      handleAuthError(e);
    }
  }

  void handleAuthError(dynamic e) {
    print(e);
    Get.snackbar('Error Login Account', 'Error in email or password',
        snackPosition: SnackPosition.TOP, colorText: Colors.black);
  }

  void saveUser(UserCredential user) async {
    if (user.user != null) {
      await FirestoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: name ?? user.user?.displayName,
        pic: '',
      ));
    }
  }
}

extension on AccessToken {
  String get token => tokenString;
}
