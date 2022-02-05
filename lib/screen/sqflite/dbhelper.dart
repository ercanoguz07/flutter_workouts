import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/photo.dart';

class DatabaseHandler {
  static Database? _db;
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    if (null == _db)
      _db = await openDatabase(
        join(path, 'photolist.db'),
        onCreate: (database, version) async {
          await database.execute(
            "CREATE TABLE photo (id INTEGER PRIMARY KEY AUTOINCREMENT,photo TEXT NOT NULL)",
          );
        },
        version: 1,
      );
    return _db!;
  }

  Future<int> insert(List<Photo> seras) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var sera in seras) {
      result = await db.insert('photo', sera.toJson());
    }
    return result;
  }

  Future<List<Photo>> allPhotos() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('photo');
    return queryResult.map((e) => Photo.fromMap(e)).toList();
  }

  Future<int> update(List<Photo> seras) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var sera in seras) {
      result = await db
          .update("photo", sera.toJson(), where: "id=?", whereArgs: [sera.id!]);
    }
    return result;
  }

  Future<void> delete(int id) async {
    final db = await initializeDB();
    await db.delete(
      'photo',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future close() async {
    _db!.close();
  }
}
