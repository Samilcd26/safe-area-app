import 'package:sqflite/sqflite.dart';

abstract class ILocalSqlite {
  //************************************************************************************************
  Future<bool> openDataBase();
  Future<Database> createDatabase();

  //************************************************************************************************
}
