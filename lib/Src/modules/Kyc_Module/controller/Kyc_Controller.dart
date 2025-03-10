
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KycController extends GetxController{
  RxString  imagePath = ''.obs;
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
}