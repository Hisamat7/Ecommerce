import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
