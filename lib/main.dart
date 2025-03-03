import 'package:ecommerce/Src/const/App_Colors.dart';
import 'package:ecommerce/Src/modules/Onboarding/views/SplashScreen.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: appBackGroundColor,
             fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home:  Splashscreen(

          ),
        );
      },
    )
  );
}
