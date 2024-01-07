import 'dart:math';

import 'package:flutter/material.dart';
import 'package:safe_area/ui/Screens/session/viewModel/file_picker_mixin.dart';

class ToolBoxPart extends StatelessWidget with FilePickerMixin {
  ToolBoxPart({super.key});

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
            ToolBoxItem(icon: Icons.description, title: "File", fun: selectFile),
            ToolBoxItem(icon: Icons.camera, title: "Camera", fun: takePhotoAndSend),
            ToolBoxItem(icon: Icons.collections_sharp, title: "Gallery", fun: pickImageFromGallery),
            ToolBoxItem(icon: Icons.multitrack_audio_outlined, title: "Audio", fun: pickAudio),
            ToolBoxItem(icon: Icons.location_on, title: "Location", fun: sendCurrentLocation),
            ToolBoxItem(icon: Icons.person_2, title: "Contact", fun: sendContact),
          ],
        ),
      ),
    );
  }
}

class ToolBoxItem extends StatelessWidget {
  ToolBoxItem({super.key, required this.icon, required this.title, required this.fun});
  IconData icon;
  String title;
  Future<void> Function() fun;
  @override
  Widget build(BuildContext context) {
    const double size = 50;
    final generatedColor = Random().nextInt(Colors.primaries.length);

    return InkWell(
      onTap: () => fun(),
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
