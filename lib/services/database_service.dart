import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/transaction.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  Future<Database> get database async => await _initDatabase();

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'database.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE trans(id TEXT PRIMARY KEY, title TEXT, amount TEXT,date TEXT)',
    );
  }

  Future<void> insertHistory(TransactionModel history) async {
    final db = await _databaseService.database;
    log(history.toMap().toString());
    await db.insert(
      'trans',
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    log(history.toMap().toString());
  }

  Future<List<TransactionModel>> histories() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('trans');
    return List.generate(
        maps.length, (index) => TransactionModel.fromMap(maps[index]));
  }

  Future<TransactionModel> history(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('trans', where: 'id = ?', whereArgs: [id]);
    return TransactionModel.fromMap(maps[0]);
  }

  Future<void> deleteHistory(String id) async {
    final db = await _databaseService.database;
    await db.delete(
      'trans',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearHistory() async {
    final db = await _databaseService.database;

    await db.delete(
      'trans',
    );
  }
}
