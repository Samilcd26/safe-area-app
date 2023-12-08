import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:safe_area/Screens/call/recents_page.dart';

class CallHistoryPage extends StatefulWidget {
  CallHistoryPage({super.key});

  @override
  State<CallHistoryPage> createState() => _CallHistoryPageState();
}

class _CallHistoryPageState extends State<CallHistoryPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool _devMod = true;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: !_devMod
            ? Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Calls", style: TextStyle(fontSize: 30)),
                        Icon(CupertinoIcons.person_crop_circle_fill_badge_plus, size: 32)
                      ],
                    ),
                  ),
                  const TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                  )),
                  TabBar(
                    controller: _tabController,
                    tabs: const <Widget>[
                      Tab(
                        text: "CONTACTS",
                      ),
                      Tab(
                        text: "RECENTS",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const <Widget>[
                        Center(
                          child: Text("It's cloudy here"),
                        ),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container(
                child: Center(
                  child: Text("Bu belevek"),
                ),
              ),
      ),
    );
  }
}
