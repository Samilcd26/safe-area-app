part of './hive_operation.dart';

mixin HiveManager<T> {
  final String _key = T.toString();

  late Box<T> _box;

  /// The function opens a Hive box of type T with the given key.
  Future<void> start() async {
    //if (Hive.isBoxOpen(_key)) return;
    _box = await Hive.openBox<T>(_key);
  }

  /// The function `clear()` clears all the data in a box.
  Future<void> clear() => _box.clear();
}
