import 'package:hive_flutter/adapters.dart';

import 'package:safe_area/core/Data/Database/model/hive_model.dart';

part './hive_manager.dart';

class HiveOperation<T extends HiveModelMixin> with HiveManager<T> {
  /// The `clear()` function clears all data stored in the `_box` object.
  @override
  Future<void> clear() => _box.clear();

  Future<void> addOrUpdateItem(String key, T model) => _box.put(key, model);

  T? getItem(String key) => _box.get(key);

  List<T> getAllValues() => _box.values.toList();

  Future<void> deleteItem(String key) => _box.delete(key);
}
