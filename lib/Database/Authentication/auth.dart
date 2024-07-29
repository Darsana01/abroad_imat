import 'package:abroad_imat/modal/Auth_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  final databaseName = "onboard.db";

  String users = 
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)";

  Future<void> deleteDatabaseIfExists() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);
    
    await deleteDatabase(path);
  }

  Future<Database> initDB() async {
    if (_database != null) return _database!;
    
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);

    _database = await openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        await db.execute(users);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        await db.execute("DROP TABLE IF EXISTS users");
        await db.execute(users);
      },
    );

    return _database!;
  }

  Future<bool> login(AuthModal user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "SELECT * FROM users WHERE username = ? AND password = ?", [user.username, user.password]);
    return result.isNotEmpty;
  }

  Future<int> signup(AuthModal user) async {
    final Database db = await initDB();
    return db.insert('users', user.toJson());
  }

  Future<void> closeDB() async {
    final Database db = await initDB();
    await db.close();
    _database = null;
  }

  Future<int> updateUser(AuthModal user) async {
    final Database db = await initDB();
    return await db.update(
      'users',
      user.toJson(),
      where: 'usrId = ?',
      whereArgs: [user.usrId],
    );
  }

  Future<AuthModal?> getUser(int usrId) async {
    final Database db = await initDB();
    var result = await db.query('users', where: 'usrId = ?', whereArgs: [usrId]);
    if (result.isNotEmpty) {
      return AuthModal(
        usrId: result.first['usrId'] as int?,
        username: result.first['username'] as String,
        password: result.first['password'] as String,
      );
    }
    return null;
  }
}

