import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';

import 'package:safe_area/ui/Components/event_select_box.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/ui/theme/constants.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  final _controller = Get.put(MainController());
  List<Widget> test = [];

  void instigation() async {
    test.add(EventSelectBox(
        user: _controller.currentUser, boxType: SELECT_BOX_TYPE.CUSTOM, boxTitle: "New Group", customIcon: Icons.people_alt_outlined));

    for (UserModel cnt in _controller.contactList!) {
      test.add(EventSelectBox(
          user: cnt, boxType: SELECT_BOX_TYPE.CREATE_SESSION, boxTitle: cnt.userName, customIcon: Icons.people_alt_outlined));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    instigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.chevron_back, size: SIZE.iconSize)),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contect", style: TextStyle(fontSize: 20)),
            Text("16 Curretn contect", style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: SIZE.iconSize)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined, size: SIZE.iconSize)),
        ],
      ),
      body: ListView(
        children: test,
      ),
    );
  }
}
