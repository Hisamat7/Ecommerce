import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:ecommerce/Src/modules/auth_Module/controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = true;
  bool keepMeSignedIn = false;
  bool emailMeSpecialOffers = false;

  LoginController loginController = Get.find<LoginController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: SizedBox(
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
                    validator: (value) =>
                        value!.isEmpty ? "Enter Name" : null,
                    controller: userNameController,
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
                    validator: (value) =>
                        value!.isEmpty ? "Enter Email" : null,
                    controller: emailController,
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
                    validator: (value) =>
                        value!.isEmpty ? "Enter Password" : null,
                    controller: passwordController,
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
                    value: keepMeSignedIn,
                    onChanged: (value) {
                      setState(() {
                        keepMeSignedIn = value!;
                      });
                    },
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
                    value: emailMeSpecialOffers,
                    onChanged: (value) {
                      setState(() {
                        emailMeSpecialOffers = value!;
                      });
                    },
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  loginController.createAccount(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    userName: userNameController.text.trim(),
                  );
                }
              },
              text: "Create Account",
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: buttonColor),
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
