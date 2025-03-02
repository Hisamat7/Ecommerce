import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/modules/Onboarding/views/SplashScreen.dart';
import 'package:ecommerce/Src/modules/auth_Module/views/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: appBackGroundColor,
             fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home:  SignIn(

          ),
        );
      },
    )
  );
}
