import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:ecommerce/Src/modules/Onboarding/views/OnBoardingTwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: SvgPicture.asset(
                    AppImages.illustration,
                  )),
              SizedBox(
                height: 40.h,
              ),
              SvgPicture.asset(
                AppImages.text,
              ),
              SizedBox(
                height: 50.h,
              ),
             
              Button(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingTwo()));
              },text: "Next",)
            ],
          ),
        ),
      ),
    );
  }
}
