import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/ui/Screens/session/viewModel/file_picker_mixin.dart';

class ToolBoxPart extends StatelessWidget with FilePickerMixin {
  const ToolBoxPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            ToolBoxItems(Icons.description, "File", selectFile()),
            ToolBoxItems(Icons.camera, "Camera", takePhotoAndSend()),
            ToolBoxItems(Icons.collections_sharp, "Gallery", pickImageFromGallery()),
            ToolBoxItems(Icons.multitrack_audio_outlined, "Audio", pickAudio()),
            ToolBoxItems(Icons.location_on, "Location", sendCurrentLocation()),
            ToolBoxItems(Icons.person_2, "Contact", sendContact()),
          ],
        ),
      ),
    );
  }

  Widget ToolBoxItems(IconData icon, String title, Future<void> fun) {
    const double size = 50;
    final generatedColor = Random().nextInt(Colors.primaries.length);

    return InkWell(
      onTap: () => fun,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: size,
              width: size,
              child: CircleAvatar(backgroundColor: Colors.primaries[generatedColor], child: SizedBox(child: Icon(icon)))),
          Text(title)
        ],
      ),
    );
  }
}
