import 'dart:async';

import '../../model/history_db.dart';
import 'history_repository.dart';
import 'history_wrapper.dart';

class HistoryBlock {
  StreamController<List<HistoryDb>> streamHistoryController = StreamController();

  HistoryRepository repo = HistoryRepository();
  HistoryBlock(this.repo);
  List<HistoryDb> operationList = [] ;

  void dell(dell) async {
    await repo.deleteOperationDb(dell);
  }

  Future<List<HistoryDb>> getOperationList() async {
    final List<HistoryDb> operationList = await repo.getOperationDb();
    streamHistoryController.sink.add(operationList);
    return operationList;

  }

  // Future<void> getHistory() async {
  //   streamHistoryController.sink.add(HistoryWrapper(
  //     isProgress: true,
  //   ));
  //   try {
  //     HistoryDb result = (await repo.getOperationDb()) as HistoryDb;
  //     HistoryDb model = HistoryDb(
  //       operation: result.operation, isProgress: false,
  //     );
  //     streamHistoryController.sink.add(HistoryWrapper(
  //       isProgress: false,
  //       objectHistory: model,
  //     ));
  //   } catch (e) {
  //     streamHistoryController.sink.add(HistoryWrapper(
  //       isProgress: false,
  //       error: e.toString(),
  //     ));
  //   }
  // }

  void dispose() {
    streamHistoryController.close();
  }
}
