import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin FilePickerMixin<T extends StatelessWidget> {
  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
  }

  Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future takePhotoAndSend() async {}

  Future pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
  }

  Future sendCurrentLocation() async {}

  Future sendContact() async {}
}
