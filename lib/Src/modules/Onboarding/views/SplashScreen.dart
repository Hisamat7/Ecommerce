import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/modules/auth_Module/controllers/LoginController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  LoginController loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    print("Current user on app start: ${FirebaseAuth.instance.currentUser}");
    Future.delayed(const Duration(seconds: 3), () {
      loginController.checkForlogin();
    });
  }

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
                AppImages.logo,
                width: 150.w,
                height: 150.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}