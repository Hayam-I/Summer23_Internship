import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "myDatabase2.db";
  static const _databaseVersion = 1;

  static const table = 'myTable';

  static const columnId = '_id';
  static const columnUserName = 'username';
  static const columnPhone = 'phone'; // Should be INTEGER or TEXT
  static const columnPassword = 'password';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await init();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  /*  Future<Database> init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  } */

  Future<Database> init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    // Check if the database file exists
    bool exists = await databaseExists(path);
    if (exists) {
      // If the database file exists, open it
      print("Opening existing database file");
      return await openDatabase(path,
          version: _databaseVersion, onCreate: _onCreate);
    } else {
      // If the database file does not exist, create a new one
      print("Creating new database file");
      return await openDatabase(path,
          version: _databaseVersion, onCreate: _onCreate);
    }
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnUserName TEXT NOT NULL,
            $columnPhone INTEGER NOT NULL,
            $columnPassword TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Query all rows in the database.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

//to check if username and password exist
  Future<List<Map<String, dynamic>>> queryUserNameAndPassword(
      String username, String password) async {
    Database db = await instance.database;
    return await db.query(table,
        where: "$columnUserName = ? AND $columnPassword = ?",
        whereArgs: [username, password]);
  }
}
