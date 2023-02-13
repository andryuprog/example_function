

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import '../../model/history_db.dart';
import '../history/history_repository.dart';

abstract class CalcBlockState extends Equatable {
}
class CalcBlocInitial extends CalcBlockState {
  @override
  List<Object?> get props => [];
}
class CalcBlocData extends CalcBlockState {
  String text;
  CalcBlocData(this.text);

  @override
  List<Object?> get props => [text];


}

class CalcBlockCubit extends Cubit<CalcBlockState>{
  CalcBlockCubit() : super(CalcBlocInitial());

  var firstValue = 0;
  var secondVal = 0;
  String history = '';
  Operations? operation;
  String historyDatabase = '';
  bool isProgress = false;
  bool isClear = false;
  String textToDisplay = '';
  HistoryRepository rep = HistoryRepository();

  //StreamController<String> streamCalcController = StreamController();

  void minusCalcController() {
    if (textToDisplay.contains('-')) {
      textToDisplay = textToDisplay.substring(1);
    } else {
      textToDisplay = ("-$textToDisplay");
    }

   // streamCalcController.sink.add
      emit(CalcBlocData(textToDisplay));
  }

  void addCalcController(String val) {
    textToDisplay = textToDisplay + val;
    //streamCalcController.sink.add
      emit(CalcBlocData(textToDisplay));
  }

  void clearCalcController() {
    textToDisplay = '';
    //streamCalcController.sink.add
    emit(CalcBlocData(textToDisplay));
  }

  void clearOneCalcController() {
    //if (textToDisplay != null) {}
    textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
    //streamCalcController.sink.add
    emit(CalcBlocData(textToDisplay));
  }

  void plus(firstVal) {
    operation = Operations.plus;
    firstValue = int.parse(firstVal);
    textToDisplay = '';
    //streamCalcController.sink.add
    emit(CalcBlocData(textToDisplay));
  }

  void subtract(firstVal) {
    operation = Operations.subtract;
    firstValue = int.parse(firstVal);
    textToDisplay = '';
    emit(CalcBlocData(textToDisplay));
    //streamCalcController.sink.add(textToDisplay);
  }

  void multiply(firstVal) {
    operation = Operations.multiply;
    firstValue = int.parse(firstVal);
    textToDisplay = '';
    emit(CalcBlocData(textToDisplay));
   // streamCalcController.sink.add(textToDisplay);
  }

  void divide(firstVal) {
    operation = Operations.divide;
    firstValue = int.parse(firstVal);
    textToDisplay = '';
    emit(CalcBlocData(textToDisplay));
    //streamCalcController.sink.add(textToDisplay);
  }

  String calc(secondVal) {
    String? result;

    switch (operation) {
      case Operations.plus:
        result = "${firstValue + int.parse(secondVal)}";
        history = '$firstValue + $secondVal = $result';
        break;

      case Operations.subtract:
        result = "${firstValue - int.parse(secondVal)}";
        history = '$firstValue - $secondVal = $result';
        break;

      case Operations.multiply:
        result = "${firstValue * int.parse(secondVal)}";
        history = '$firstValue * $secondVal = $result';
        break;

      case Operations.divide:
        result = "${firstValue / int.parse(secondVal)}";
        history = '$firstValue / $secondVal = $result';
        break;
      default:
        result = "0";
    }

    rep.insertOperationDb(HistoryDb(
        operation: history,
        time: DateFormat('yyyy - MMMM - dd HH:mm:ss').format(DateTime.now()),
        isProgress: false));

    return result;
  }
// void dispose() {
//   streamCalcController.close();
// }
}

enum Operations { plus, subtract, multiply, divide }