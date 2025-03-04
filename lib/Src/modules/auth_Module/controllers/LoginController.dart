import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  createAccount(
      {required String email,
      required String password,
      String? userName}) async {
    try {
   final credential  =   await FirebaseAuth.instance .createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBar(content: Text('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        SnackBar(content: Text('The account already exists for that email.'));
      }
    }
    
     catch (e) {
      AlertDialog(
        content: Text(e.toString()),
      );
    }
  }
}
