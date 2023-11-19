import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_area/Screens/home/groups_page.dart';
import 'package:safe_area/Screens/home/single_page.dart';
import 'package:safe_area/setting/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _groupsTab = false;

  final List<Tab> myTabs = <Tab>[
    Tab(child: SinglePage()),
    Tab(child: GroupsPage()),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.animation?.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    var activeIndex = _tabController.index;
    if (_tabController.indexIsChanging) {
      if (activeIndex != _tabController.index) {
        activeIndex = _tabController.index;
      }
      //! this will catch a tab change by swipe
    } else {
      final int temp = _tabController.animation!.value.round();
      if (activeIndex != temp) {
        activeIndex = temp;
        //! this will make the tab bar animation to happen right away instead at the end of the swipe animation
        _tabController.index = activeIndex;
        setState(() {
          _groupsTab = _tabController.index == 1 ? true : false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switchTab(bool group) {
      setState(() {
        //!toolPage = toolPage ? false : true;
        _groupsTab = group ?? false;
        _tabController.index = _groupsTab ? 1 : 0;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const FlutterLogo(),
          actions: [
            CupertinoSwitch(
                value: _groupsTab,
                onChanged: (bool value) {
                  switchTab(value);
                }),
            const SizedBox(width: 20),
            const Icon(Icons.search, size: SIZE.tabIcon),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(controller: _tabController, children: myTabs),
      ),
    );
  }
}
