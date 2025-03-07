import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:ecommerce/Src/modules/auth_Module/controllers/LoginController.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  LoginController loginController = Get.find<LoginController>();
  Widget googleAndFacebook({required String text, required String image}) {
    return Container(
      height: 50.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF252525),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          Image.asset(image),
        ],
      ),
    );
  }

  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300.h,
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
                      height: 60.h,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) => value!.isEmpty ? "Enter email" : null,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
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
                      controller: passwordController,
                      validator: (value) => value!.isEmpty ? "Enter password" : null,
                      style: TextStyle(color: Colors.white),
                      obscureText: obscureText,
                      decoration: InputDecoration(
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
              Center(
                child: Text(
                  "Or continue with",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  googleAndFacebook(
                      text: "Facebook", image: AppImages.facebookicon),
                  googleAndFacebook(
                      text: "Google", image: AppImages.googleicon),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Text(
                  "Forgot Your Password?",
                  style: TextStyle(color: buttonColor),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Button(
                onPressed: () {
                  if(loginKey.currentState!.validate()){
                    loginController.loginAccount(email: emailController.text, password: passwordController.text);
                  }
                },
                text: "Login",
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(()=>SignUp());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: buttonColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
