
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:water/model/user.dart';

class DataBaseHelper {
  static const _databaseName = 'health.db';
  static const _databaseVersion = 2;

  static const table = "user";
  static const columnId = "id";
  static const columnName = "name";
  static const columnAge = "age";
  static const columnWeight = "weight";
  static const columnGender = "gender";
  static const columnPerDay = "perDayNbr";
  static const columnClassAge = "classAge";
  static const columnVerreNbr = "verreNbr";

  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    print('Succès $_database');
    return _database!;
  }

  Future<Database> _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: (db, version) {
      db.execute('''
      CREATE TABLE IF NOT EXISTS $table (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnAge INTEGER NOT NULL,
        $columnGender TEXT NOT NULL,
        $columnWeight INTEGER NOT NULL,
        $columnClassAge TEXT NOT NULL,
        $columnVerreNbr INTEGER NOT NULL,
        $columnPerDay INTEGER NOT NULL

      )
      ''');
    });
  }

  static Future<void> insertData(User user) async {
    final Database db = await instance.database;
    await db.insert(
      table,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateData(User user) async {
    final Database db = await instance.database;
    await db.update(
      table,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<List<Map<String, dynamic>>> getUserData(int id) async {
    final Database db = await instance.database;
    return db.query(table, where: "id = ?", whereArgs: [id], limit: 1);
  }
}
