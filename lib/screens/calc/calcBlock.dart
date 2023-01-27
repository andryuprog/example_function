import 'package:intl/intl.dart';
import '../../model/history_db.dart';
import '../history/history_repository.dart';

class CalcBlock {
  var firstValue = 0;
  var secondVal = 0;
  String history = '';
  Operations? operation;
  String historyDatabase = '';
  bool isProgress = false;
  bool isClear = false;
  HistoryRepository rep = HistoryRepository();



  void plus(firstVal) {
    operation = Operations.plus;
    firstValue = int.parse(firstVal);
  }

  void subtract(firstVal) {
    operation = Operations.subtract;
    firstValue = int.parse(firstVal);
  }

  void multiply(firstVal) {
    operation = Operations.multiply;
    firstValue = int.parse(firstVal);
  }

  void divide(firstVal) {
    operation = Operations.divide;
    firstValue = int.parse(firstVal);
  }

  String calc(secondVal) {
    String? result;

    switch (operation!) {
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
        time: DateFormat('yyyy - MMMM - dd HH:mm:ss').format(DateTime.now())));

    return result;
  }
}

enum Operations { plus, subtract, multiply, divide }
