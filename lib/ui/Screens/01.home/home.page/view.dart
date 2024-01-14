import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/network.dart';
import 'package:safe_area/ui/Screens/contacts/select.contact.page/view.dart';

import 'package:safe_area/ui/Screens/01.home/home.page/view.mixin.dart';
import 'package:safe_area/ui/theme/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, HomeMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: myTabs.length);
    tabController.animation?.addListener(handleTabSelection);
  }

  defaultHomeAppBarActions() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const FlutterLogo(),
      actions: [
        CupertinoSwitch(
            value: groupsTab,
            onChanged: (bool value) {
              switchTab(value);
            }),
        const SizedBox(width: 20),
        const Icon(Icons.search, size: SIZE.tabIcon),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(tabController.index == 0 ? CupertinoIcons.person_solid : CupertinoIcons.person_3_fill),
            onPressed: () {
              Get.to(SelectContactPage());
            }),
        appBar: defaultHomeAppBarActions(),
        body: TabBarView(controller: tabController, children: myTabs),
      ),
    );
  }
}
