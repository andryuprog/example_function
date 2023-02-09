import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/history_db.dart';
import 'history_bloc_state.dart';
import 'history_repository.dart';
import 'history_wrapper.dart';

enum CalcEvent {
  addNumber,
  delEvent,
}

class HistoryBlockCubit extends Cubit<HistoryBlockState>{
  //StreamController<List<HistoryDb>> streamHistoryController = StreamController();
  HistoryBlockCubit(this.historyRepository) : super (HistoryBlocInitial());
  //{getOperationList();} :

  HistoryRepository historyRepository;
  List<HistoryDb> operationList = [];
   //final HistoryRepository historyRepository;
//  HistoryBlock (this.historyRepository)


  void dell(dell) async {
    await historyRepository.deleteOperationDb(dell);
    getOperationList();
  }

  Future<List<HistoryDb>> getOperationList() async {
   // final List<HistoryDb> operationList = await historyRepository.getOperationDb();
    emit(HistoryBlocDataBase(await historyRepository.getOperationDb()));
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

  // void dispose() {
  //   streamHistoryController.close();
  // }
}
