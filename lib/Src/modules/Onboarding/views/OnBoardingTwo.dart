import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingTwo extends StatefulWidget {
  const OnBoardingTwo({super.key});

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: SvgPicture.asset(AppImages.illustration2),
              ),
              SizedBox(
                height: 40.h,
              ),
              SvgPicture.asset(AppImages.text2),
              SizedBox(
                height: 40.h,
              ),
             Button(text: "Next", onPressed: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
             })
            ],
          ),
        ),
      ),
    );
  }
}
