// import '../../model/history_db.dart';
//
 import 'package:my_calculate/screens/history/history_block_cubit.dart';

class HistoryWrapper {
   HistoryBlockCubit? dellHistoryDb;
  String? error;
  bool isProgress = false;

  HistoryWrapper({
    this.dellHistoryDb,
    required this.isProgress,
    this.error});
 }