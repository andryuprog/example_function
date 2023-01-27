import '../../model/history_db.dart';
import 'history_repository.dart';

class HistoryBlock {
  HistoryRepository repo = HistoryRepository();

  void dell(dell) async {
    await repo.deleteOperationDb(dell);
  }

  Future<List<HistoryDb>> getOperationList() async {
    final List<HistoryDb> operationList = await repo.getOperationDb();
    // setState(() {});
    return operationList;
  }
}
