import 'dart:io';

import 'package:filmgeek/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const dbName = "film_geek.db";
  static const dbVersion = 1;
  static const dbTable = "user_credentials";
  static const columnId = 'id';
  static const columnUserName = 'user_name';
  static const columnEmail = 'email';
  static const columnPassword = 'password';
  static const columnPhoneNumber = 'phone_number';
  static const columnProfession = 'profession';
  static const columnIsLoggedIn = 'is_logged_in';

  static final DatabaseHelper instance = DatabaseHelper();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE $dbTable (
        $columnId INTEGER PRIMARY KEY,
        $columnUserName TEXT NOT NULL,
        $columnEmail TEXT UNIQUE NOT NULL,
        $columnPassword TEXT NOT NULL,
        $columnPhoneNumber TEXT NOT NULL,
        $columnProfession TEXT NOT NULL,
        $columnIsLoggedIn INTEGER NOT NULL DEFAULT 0
      )
      ''');
  }

  Future<bool> checkEmailAvailability(String email) async {
    try {
      Database? db = await instance.database;
      List<Map<String, dynamic>> result = await db!.query(
        dbTable,
        where: '$columnEmail = ?',
        whereArgs: [email],
        columns: [columnEmail],
      );

      return result.isEmpty;
    } catch (e) {
      print('Error checking email availability: $e');
      return false; 
    }
  }

  Future<bool> addUserDetails(User user) async {
    try {
      Database? db = await instance.database;
      await db!.insert(dbTable, user.toMap());
      return true;
    } catch (e) {
      print('Error inserting user: $e');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      Database? db = await instance.database;
      List<Map<String, dynamic>> result = await db!.query(
        dbTable,
        where: '$columnEmail = ? AND $columnPassword = ?',
        whereArgs: [email, password],
      );

      return result.isNotEmpty;
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  Future<bool> checkUserLoggedIn(String email) async {
    try {
      Database? db = await instance.database;
      List<Map<String, dynamic>> result = await db!.query(
        dbTable,
        where: '$columnEmail = ? AND $columnIsLoggedIn = ?',
        whereArgs: [email, 1], 
      );

      return result.isNotEmpty;
    } catch (e) {
      print('Error checking user login status: $e');
      return false; 
    }
  }
}