import 'package:ecommerce/Src/const/AppBarForApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ecommerce/Src/modules/Kyc_Module/controller/Kyc_Controller.dart'; // Import the KycController

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  final KycController kycController = Get.find<KycController>(); // Get the instance of KycController

  @override
  void initState() {
    super.initState();
    // Fetch the current location when the screen is loaded
    kycController.pickLocation();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Set Your Location",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "This data will be displayed in your account \nprofile for security",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFF252525),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.orange,
                    ),
                  ),
                  title: Obx(() => Text(
                    kycController.location.value.isEmpty
                        ? "Fetching location..."
                        : kycController.location.value,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () async {
                    
                    await kycController.pickLocation();
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Select Location",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    height: 55.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}