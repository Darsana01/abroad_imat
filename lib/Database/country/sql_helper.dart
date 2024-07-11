import 'package:abroad_imat/modal/country_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'countries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE countries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        image TEXT
      )
      '''
    );
  }

  Future<void> insertCountry(Country country) async {
    final db = await database;
    await db.insert(
      'countries',
      country.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Country>> getCountries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('countries');

    return List.generate(maps.length, (i) {
      return Country(
        name: maps[i]['name'],
        image: maps[i]['image'],
      );
    });
  }

  Future<void> deleteAllCountries() async {
    final db = await database;
    await db.delete('countries');
  }
}
