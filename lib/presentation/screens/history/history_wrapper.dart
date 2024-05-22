import 'history_block_cubit.dart';

class HistoryWrapper {
  HistoryBlockCubit? dellHistoryDb;
  String? error;
  bool isProgress = false;

  HistoryWrapper({this.dellHistoryDb, required this.isProgress, this.error});
}
