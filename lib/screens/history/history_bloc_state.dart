
import 'package:equatable/equatable.dart';
import '../../model/history_db.dart';


abstract class HistoryBlockState extends Equatable {
  const HistoryBlockState();
}

class HistoryBlocInitial extends HistoryBlockState{
  @override
  List<Object?> get props => [];
}

class HistoryBlocLoading extends HistoryBlockState {
  @override
  List<Object?> get props => [];
}

class HistoryBlocDataBase extends HistoryBlockState {
  List<HistoryDb> dataBaseList;
  HistoryBlocDataBase(this.dataBaseList);
  @override
  List<Object?> get props => [dataBaseList];
}


class HistoryBlocError extends HistoryBlockState {
  String historyError;
  HistoryBlocError(this.historyError);
  @override
  List<Object?> get props => [historyError];
}
