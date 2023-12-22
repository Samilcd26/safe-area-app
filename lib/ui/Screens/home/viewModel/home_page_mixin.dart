import 'package:flutter/material.dart';

import 'package:safe_area/core/Data/Database/model/session_hive_operation.dart';
import 'package:safe_area/ui/Screens/home/view/groups_page.dart';
import 'package:safe_area/ui/Screens/home/view/single_page.dart';

mixin HomeMixin<T extends StatefulWidget> on State<T> {
  final SessionHiveOperation _sessionDatabaseOperation = SessionHiveOperation();
  bool groupsTab = false;

  final List<Tab> myTabs = <Tab>[
    Tab(child: SinglePage()),
    Tab(child: GroupsPage()),
  ];

  late TabController tabController;

  handleTabSelection() {
    var activeIndex = tabController.index;
    if (tabController.indexIsChanging) {
      if (activeIndex != tabController.index) {
        activeIndex = tabController.index;
      }
      //! this will catch a tab change by swipe
    } else {
      final int temp = tabController.animation!.value.round();
      if (activeIndex != temp) {
        activeIndex = temp;
        //! this will make the tab bar animation to happen right away instead at the end of the swipe animation
        tabController.index = activeIndex;
        setState(() {
          groupsTab = tabController.index == 1 ? true : false;
        });
      }
    }
  }

  switchTab(bool group) {
    setState(() {
      //!toolPage = toolPage ? false : true;
      groupsTab = group;
      tabController.index = groupsTab ? 1 : 0;
    });
  }

  Future<void> initDatabase() async {
    await _sessionDatabaseOperation.start();
  }
}
