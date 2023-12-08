import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  bool _devMod = true;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, child: Center(child: Text("Bu Gelecek")));
  }
}
