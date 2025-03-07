import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignIn.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignUpProcess.dart';
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
   Get.off(() => SignIn());
   FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({"userName":userName,"userEmail":email});
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
  loginAccount({required String email,required String password})async{
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Get.off(() => SignUpProcess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBar(content: Text('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        SnackBar(content: Text('Wrong password provided for that user.'));
      }
    }
    catch (e) {
      AlertDialog(
        content: Text(e.toString()),
      
      );
      
    }
  }
}
