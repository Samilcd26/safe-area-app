import 'package:safe_area/Business/ILocalSqlite.dart';
import 'package:sqflite/sqflite.dart';

class LocalSqlite extends ILocalSqlite {
  @override
  Future<bool> openDataBase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

    Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });

    return true;
  }

  @override
  Future<Database> createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}my.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE Customer ("
        "id INTEGER PRIMARY KEY,"
        "first_name TEXT,"
        "last_name TEXT,"
        "email TEXT"
        ")");
  }
}
