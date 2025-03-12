import 'dart:io';

import 'package:ecommerce/Src/const/AppBarForApp.dart';
import 'package:ecommerce/Src/const/App_Images.dart';
import 'package:ecommerce/Src/const/Button.dart';
import 'package:ecommerce/Src/modules/Kyc_Module/controller/Kyc_Controller.dart';
import 'package:ecommerce/Src/modules/Kyc_Module/views/SetLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Uploadimagescreen extends StatefulWidget {
  const Uploadimagescreen({super.key});

  @override
  State<Uploadimagescreen> createState() => _UploadimagescreenState();
}

class _UploadimagescreenState extends State<Uploadimagescreen> {
  KycController kycController = Get.find<KycController>();

  Widget uploadContainer({required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFF252525),
        ),
        child: Image.asset(image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarforapp(
        onPressed: () {
          Get.back();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "Upload Your Profile \nPicture",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "This data will be displayed in your account \nprofile for security",
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Obx(
            () => kycController.imagePath.value.isNotEmpty
                ? Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w, right: 20.w),
                        height: 250.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFF252525),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            File(kycController.imagePath.value),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 30.w,
                        child: GestureDetector(
                          onTap: () {
                            kycController.clearImage();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      uploadContainer(
                        image: AppImages.galleryicon,
                        onTap: () async {
                          await kycController.pickImageFromGallery();
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      uploadContainer(
                        image: AppImages.cameraicon,
                        onTap: () async {
                          await kycController.pickImageFromCamera();
                        },
                      ),
                    ],
                  ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
            child: Button(
              text: "Next",
              onPressed: () {
                if (kycController.imagePath.value.isNotEmpty) {
                  Get.to(() => SetLocation());
                } else {
                  Get.snackbar(
                    "Error",
                    "Please select an image",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}