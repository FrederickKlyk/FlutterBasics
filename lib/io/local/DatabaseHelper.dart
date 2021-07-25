import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'TVSeries.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Creates the database structure
  Future _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
          CREATE TABLE TVSeries (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            image TEXT,
            episodes INTEGER,
            description TEXT
          )
          ''');
  }

  Future<List<TVSeries>?> fetchAllTvSeries() async {
    Database database = _database != null ? _database : await _initDatabase();
    List<Map<String, dynamic>> maps = await database.query('TVSeries');
    if (maps.isNotEmpty) {
      return maps.map((map) => TVSeries.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<int> addTVSeries(TVSeries tvSeries) async {
    Database database = _database != null ? _database : await _initDatabase();
    return database.insert(
      'TVSeries',
      tvSeries.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}
