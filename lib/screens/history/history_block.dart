import 'dart:async';

import '../../model/history_db.dart';
import 'history_repository.dart';
import 'history_wrapper.dart';

enum CalcEvent {
  addNumber,
  delEvent,
}

class HistoryBlock {
  StreamController<List<HistoryDb>> streamHistoryController = StreamController();

  HistoryRepository historyRepository;
  HistoryBlock(this.historyRepository){getOperationList();}
  List<HistoryDb> operationList = [];
   //final HistoryRepository historyRepository;
//  HistoryBlock (this.historyRepository)


  void dell(dell) async {
    await historyRepository.deleteOperationDb(dell);
    getOperationList();
  }

  Future<List<HistoryDb>> getOperationList() async {
    final List<HistoryDb> operationList = await historyRepository.getOperationDb();
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
