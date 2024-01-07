import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin FilePickerMixin<T extends StatefulWidget> {
  FilePickerResult? result;
  Future<void> selectFile() async {
    print("object");
    result = await FilePicker.platform.pickFiles();
    print(result);

    /*
    Uint8List fileBytes = result.files.first.bytes;
    String fileName = result.files.first.name;
     */
  }

  Future pickImageFromGallery() async {
    var returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future takePhotoAndSend() async {}

  Future pickAudio() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );
  }

  Future sendCurrentLocation() async {}

  Future sendContact() async {}
}
