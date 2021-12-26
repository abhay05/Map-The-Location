import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> getDb() async {
    String dbpath = await sql.getDatabasesPath();
    final locationsDb = sql.openDatabase(
      path.join(dbpath, "locationsDb.db"),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE locations(id TEXT PRIMARY KEY, title TEXT,description TEXT, image TEXT)',
        );
      },
      version: 1,
    );
    return locationsDb;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    Database locationsDb = await getDb();
    print("got db");
    print(table);
    print(data);

    locationsDb.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object>>> getRecord(String table) async {
    Database locationsDb = await getDb();
    final data = locationsDb.rawQuery("select * from $table");
    print("get table");
    print(data);
    return data;
  }
}
