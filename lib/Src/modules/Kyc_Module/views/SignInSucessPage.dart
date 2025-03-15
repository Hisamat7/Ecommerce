import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:ecommerce/Src/modules/auth_Module/controllers/LoginController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInSucessPage extends StatefulWidget {

  @override
  State<SignInSucessPage> createState() => _SignInSucessPageState();
}

class _SignInSucessPageState extends State<SignInSucessPage> {
  LoginController loginController = Get.find<LoginController>();

  @override
 
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackGroundColor,
        body: Stack(
          children: [
            // Background Image with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.2), Colors.black],
                ),
              ),
              child: Image.asset(
                AppImages.background,
                fit: BoxFit.cover,
                width: size.width,
              ),
            ),
            // Centered Logo
            Center(
              child: Image.asset(
                AppImages.tick,
                width: 150.w,
                height: 150.h,
              ),
            ),
            Positioned(
              bottom: 270.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Text(
                  "Congrats!",
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              
               )),
            Positioned(
              bottom: 230.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Text(
                  "Your Profile is Ready to Use",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            Positioned(
              bottom: 100.h,
              left: 0.w,
              right: 0.w,
            child: Center(
              child: Button(
                text: "Try Order",
               
                onPressed: () {
               
                
                },              
              ),))
          ],
        ),
      ),
    );
  }
}