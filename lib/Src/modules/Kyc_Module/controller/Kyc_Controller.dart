import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Src/modules/Kyc_Module/module/user_database_model.dart';
import 'package:ecommerce/Src/modules/Kyc_Module/views/SignInSucessPage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location; // Hide the Location class
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart'; // Use the Location class from this package

class KycController extends GetxController {
  RxString imagePath = ''.obs;
  RxString location = ''.obs;
  RxString firstname = ''.obs;
  RxString lastname = ''.obs;
  RxString  phonenumber =''.obs;
  final firestore = FirebaseFirestore.instance.collection('users');

  Future<void> pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath(image.path);
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath(image.path);
    }
  }

  void clearImage() {
    imagePath.value = '';
  }

  Future<void> pickLocation() async {
    Location locationService = Location(); 

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    try {
      // Check if location services are enabled
      serviceEnabled = await locationService.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await locationService.requestService();
        if (!serviceEnabled) {
          return; // Location services are not enabled
        }
      }

      // Check for location permissions
      permissionGranted = await locationService.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await locationService.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return; // Location permissions are not granted
        }
      }

      // Get the current location
      locationData = await locationService.getLocation();

      // Get the address from the coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locationData.latitude!,
        locationData.longitude!,
      );

      // Update the location RxString with the address
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        location.value =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      } else {
        location.value =
            'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}';
      }
    } catch (e) {
      // Handle any errors that occur during the process
      location.value = 'Failed to fetch location: $e';
    }
  }
  Future<void> storeKycData() async {
   UserProfile userProfile = UserProfile(
     firstName: firstname.value,
     lastName: lastname.value,
     mobileNumber: phonenumber.value,
     locationName: location.value,
     profileImg: imagePath.value,
   );
   await firestore.add(userProfile.toJson()).then((value) => Get.to(SignInSucessPage())).catchError((error) =>  Get.snackbar(
                    "Error",
                    "Please try again",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  ));
   
}
}