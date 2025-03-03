import 'package:ecommerce/Src/const/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpProcess extends StatefulWidget {
  const SignUpProcess({super.key});

  @override
  State<SignUpProcess> createState() => _SignUpProcessState();
}

class _SignUpProcessState extends State<SignUpProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.only(left: 6.w),
          margin: EdgeInsets.only(left: 10.w, top: 10.h),
          decoration: BoxDecoration(
            color: Color(0xFF252525),
            borderRadius: BorderRadius.circular(17),
          ),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
                color: Color(0xFFDA6317),
              )),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Fill in your bio to get \nstarted",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "This data will be displayed in your account \nprofile for security",
              style: TextStyle(fontSize: 10.sp, color: Colors.white),
            ),
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "First Name",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 103, 102, 102)),
                  hintText: "First Name",
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
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Last Name",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 103, 102, 102)),
                  hintText: "Last Name",
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
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Mobile Number",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 103, 102, 102)),
                  hintText: "Mobile Number",
                  fillColor: Color(0xFF252525),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: Button(
              onPressed: () {},
              text: "Next",
            ),
          ),
        ],
      ),
    );
  }
}
