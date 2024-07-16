import 'package:abroad_imat/modal/Auth_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final databaseName = "onboard.db";

  String users = 
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)"; // Corrected column name

  Future<void> deleteDatabaseIfExists() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);
    
    // Delete the existing database
    await deleteDatabase(path);
  }

  Future<Database> initDB() async {
    await deleteDatabaseIfExists(); // Clear existing database (for development only)

    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);

    return await openDatabase(
      path,
      version: 2, // Incremented version
      onCreate: (Database db, int version) async {
        await db.execute(users);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // Drop the existing table and create a new one
        await db.execute("DROP TABLE IF EXISTS users");
        await db.execute(users);
      },
    );
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
}
