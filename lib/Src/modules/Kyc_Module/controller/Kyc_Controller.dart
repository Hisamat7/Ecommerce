import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class KycController extends GetxController {
  RxString imagePath = ''.obs;
  RxString location = ''.obs;

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
    Location locationService = Location(); // Renamed to avoid conflict

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

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

    // Update the location RxString with latitude and longitude
    location.value =
        'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}';
  }
}