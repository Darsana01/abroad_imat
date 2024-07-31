import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../modal/university_modal.dart';

class UniversityDatabaseHelper {
  static final UniversityDatabaseHelper _instance = UniversityDatabaseHelper._();
  static Database? _database;

  UniversityDatabaseHelper._();

  factory UniversityDatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'university.db');
    return await openDatabase(
      path,
      version: 2, // Incremented the version
      onCreate: _onCreate,
      onUpgrade: _onUpgrade, // Added onUpgrade method
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE universities (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add content column to the table
      await db.execute('ALTER TABLE universities ADD COLUMN content TEXT NOT NULL DEFAULT "[]"');
    }
  }

  Future<void> insertUniversity(University university) async {
    final db = await database;
    await db.insert(
      'universities',
      university.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<University>> getUniversities() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('universities');

    return List.generate(maps.length, (i) {
      return University.fromMap(maps[i]);
    });
  }

  Future<void> deleteAllUniversities() async {
    final db = await database;
    await db.delete('universities');
  }
}
