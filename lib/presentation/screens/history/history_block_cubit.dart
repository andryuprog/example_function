import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/history_db.dart';
import '../../../data/repositories/history_repository.dart';
import 'history_bloc_state.dart';


class HistoryBlockCubit extends Cubit<HistoryBlockState> {
  HistoryBlockCubit(this.historyRepository) : super(HistoryBlocInitial()) {
    getOperationList();
  }

  HistoryRepository historyRepository;
  List<HistoryDb> operationList = [];

  void dell(dell) async {
    await historyRepository.deleteOperationDb(dell);
    getOperationList();
  }

  Future<List<HistoryDb>> getOperationList() async {
    emit(HistoryBlocDataBase(await historyRepository.getOperationDb()));
    return operationList;
  }
}