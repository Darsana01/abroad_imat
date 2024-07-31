import 'package:abroadimat/modal/Auth_modal.dart';
import 'package:abroadimat/modal/level_modal.dart';
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
    final path = join(databasePath, 'universitylevel.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE universitieslevel (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            intake TEXT,
            tuitionFee TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('''
            DROP TABLE IF EXISTS universitieslevel
          ''');
          await db.execute('''
            CREATE TABLE universitieslevel (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              intake TEXT,
              tuitionFee TEXT
            )
          ''');
        }
      },
    );
  }

  Future<void> insertLevel(Levelmodal level) async {
    final db = await database;
    await db.insert(
      'universitieslevel',
      level.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Levelmodal>> getLevels() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('universitieslevel');

    return List.generate(maps.length, (i) {
      return Levelmodal.fromMap(maps[i]);
    });
  }

   Future<void> signup(AuthModal user) async {
    final db = await database;
    var res = await db.query("users", where: "username = ?", whereArgs: [user.username]);

    if (res.isNotEmpty) {
      throw Exception('Username already exists');
    } else {
      await db.insert("users", user.toJson());
    }
  }
}
