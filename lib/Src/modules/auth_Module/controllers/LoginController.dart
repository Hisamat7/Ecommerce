import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Src/modules/Onboarding/views/OnBoardingOne.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignIn.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignUpProcess.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Future<void> createAccount({
    required String email,
    required String password,
    String? userName,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Store user data in Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set({
        "userName": userName,
        "userEmail": email,
      });

      Get.off(() => SignIn());
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      Get.snackbar('Error', errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } catch (e) {
      Get.dialog(
        AlertDialog(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future<void> loginAccount({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.off(() => SignUpProcess());
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email provided.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid credentials provided.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      Get.snackbar('Error', errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } catch (e) {
      Get.dialog(
        AlertDialog(
          content: Text(e.toString()),
        ),
      );
    }
  }
  Future<void>checkForlogin()async{
   FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if(user!=null){
       Get.offAll(() => SignUpProcess());
     }
     else{
       Get.offAll(() => OnBoardingOne());
     }
   });
  }
}