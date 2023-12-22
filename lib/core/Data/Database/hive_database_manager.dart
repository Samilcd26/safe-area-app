// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safe_area/core/Data/Models/message_model.dart';

import 'package:safe_area/core/Data/Models/session_model.dart';
import 'package:safe_area/core/Data/Models/user_model.dart';

abstract class IHiveDatabaseManager {
  // ignore: non_constant_identifier_names
  Future<void> Initialize();

  Future<void> clear();
}

@immutable
final class HiveDatabaseManager extends IHiveDatabaseManager {
  @override
  Future<void> Initialize() async {
    await _open();
    _initializeOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  //* Open your database connection
  Future<void> _open() async {
    await Hive.initFlutter();
  }

  //* Register your generic model or make your operation before starting
  void _initializeOperation() {
    Hive.registerAdapter(UserModelImplAdapter());
    Hive.registerAdapter(MessageModelImplAdapter());
    Hive.registerAdapter(SessionModelImplAdapter());
  }
}
