import 'package:my_calculate/db/database.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/history_db.dart';

class HistoryRepository{


  //READ

  Future<List<HistoryDb>> getOperationDb() async {
    Database db = await DBProvider.db.database;
    final List<Map<String, dynamic>> operationMapList =
    await db.query(DBProvider.db.operationTable);
    final List<HistoryDb> operationList = [];
    for (var operationMap in operationMapList) {
      operationList.add(HistoryDb.fromMap(operationMap));
    }
    return operationList;

  }

  // INSERT

  Future<HistoryDb> insertOperationDb(HistoryDb operation) async {
    Database db = await DBProvider.db.database;
    operation.id = await db.insert(DBProvider.db.operationTable, operation.toMap());
    return operation;
  }

  //UPDATE

  // Future<int> updateOperation(Operations operations) async {
  //   Database db = await database;
  //   return await db.update(
  //     operationTable,
  //     operations.toMap(),
  //     where: '$columnId = ?',
  //     whereArgs: [operations.id],
  //   );
  // }

//DELETE

 Future<int> deleteOperationDb(int id) async {
    Database db = await DBProvider.db.database;
    return await db.delete(
      DBProvider.db.operationTable,
      where: '${DBProvider.db.columnId} = ?',
      whereArgs: [id],
    );
  }

//ADD

// addOperations(Operations toDB) async {
//     Database db = await database;
//     await db.rawInsert("INSERT INTO $operationTable($operationRes)"
//     "VALUES (?)",
//     [toDB.id],
//     );
// }
}