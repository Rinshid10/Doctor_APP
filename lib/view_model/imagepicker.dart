import 'dart:developer';
import 'dart:io';

import 'package:doctor_app/services/ImageServices/imagestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageControllerss extends ChangeNotifier {
  Imageservices ser = Imageservices();

  File? imageFile;
  var data;
  final ImagePicker _imagePicker = ImagePicker();

  Future pickImage() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        log(imageFile.toString());
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  uplodImage(File image) async {
    final datas = await ser.uploadImage(image);
    data = datas;
    log('the path  image is $data');
    notifyListeners();
  }
}
