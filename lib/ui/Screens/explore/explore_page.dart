import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  bool _devMod = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            width: 60,
            height: 60,
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
