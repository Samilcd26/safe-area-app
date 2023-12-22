import 'package:flutter/material.dart';
import 'package:safe_area/core/Data/Database/model/session_hive_operation.dart';

final class RootContext extends InheritedWidget {
  RootContext({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
