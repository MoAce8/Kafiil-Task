import 'dart:async';
import 'package:image_picker/image_picker.dart';

Future<String> pickFromGallery() async {
  final ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    return file.path;
  }
  return '';
}


pickFromCamera() async {
  final ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(source: ImageSource.camera);
  if (file != null) {
    return await file.readAsBytes();
  }
}
