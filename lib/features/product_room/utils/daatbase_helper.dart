import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'item_database.db';
  static const _databaseVersion = 1;
  static const _tableName = 'items';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnPrice = 'price';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnPrice REAL NOT NULL
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return db.query(_tableName);
  }

  Future<int> insertItem(String name, double price) async {
    final db = await database;
    return db.insert(_tableName, {columnName: name, columnPrice: price});
  }

  Future<int> updateItem(int id, String name, double price) async {
    final db = await database;
    return db.update(
      _tableName,
      {columnName: name, columnPrice: price},
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return db.delete(
      _tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
