import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  String operationTable = 'tableName5';
  String operationRes = 'operation';
  String columnId = 'id';
  String columnTime = 'time';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}tableName5.db';
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  //operation
  // id | operationRes | data

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE $operationTable($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $operationRes TEXT,$columnTime TEXT)''');
  }
}
