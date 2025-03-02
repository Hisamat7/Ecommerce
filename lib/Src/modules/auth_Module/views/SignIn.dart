import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.background,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 0.h,
                    left: 0.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: Image.asset(
                      AppImages.logo,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      "Sign Up For Free",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            color: const Color.fromARGB(255, 53, 129, 55)),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Name",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 103, 102, 102)),
                        hintText: "Full Name",
                        fillColor: Color(0xFF252525),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,
                            color: const Color.fromARGB(255, 53, 129, 55)),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Email",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 103, 102, 102)),
                        hintText: "Email",
                        fillColor: Color(0xFF252525),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: obscureText,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,
                            color: const Color.fromARGB(255, 53, 129, 55)),
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        labelText: "Password",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 103, 102, 102)),
                        hintText: "Password",
                        fillColor: Color(0xFF252525),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    activeColor: buttonColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Keep me signed in",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    activeColor: buttonColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Email me about special offers",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Button(
              onPressed: () {},
              text: "Create Account",
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Text(
                "Already have an account?",
                style: TextStyle(color: buttonColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
