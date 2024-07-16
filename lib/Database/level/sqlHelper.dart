import 'package:abroad_imat/modal/level_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'university.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE universities (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            intake TEXT,
            tuitionFee TEXT
          )
        ''');
      },
      onOpen: (db) async {
        await db.execute('''
          DROP TABLE IF EXISTS universities
        ''');
        await db.execute('''
          CREATE TABLE universities (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            intake TEXT,
            tuitionFee TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertLevel(Levelmodal level) async {
    final db = await database;
    await db.insert(
      'universities',
      level.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Levelmodal>> getLevels() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('universities');

    return List.generate(maps.length, (i) {
      return Levelmodal.fromMap(maps[i]);
    });
  }
}
