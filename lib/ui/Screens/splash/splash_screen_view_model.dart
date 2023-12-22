import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:safe_area/core/Data/Database/model/session_hive_operation.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';
import 'package:safe_area/core/Data/State/main_controller.dart';
import 'package:safe_area/ui/Screens/root/root.dart';

mixin SplashViewModel<T extends StatefulWidget> on State<T> {
  final SessionHiveOperation _sessionDatabaseOperation = SessionHiveOperation();
  final _controller = Get.put(MainController());

  @override
  void initState() {
    initSplashState();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 1), () {
      Get.to(const RootPage());
    });
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
      setState(() {
        _controller.contactList = contacts.map((e) => UserModel.fromContact(e)).toList();
      });
    }
  }

  Future<void> initSplashState() async {
    await _fetchContacts();
    await _sessionDatabaseOperation.start();
  }
}
