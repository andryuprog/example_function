
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
  final String text;
  CalcBlocData(this.text);

  @override
  List<Object?> get props => [text];
}

class CalcBlockCubit extends Cubit<CalcBlockState>{
  CalcBlockCubit(this.historyRepository) : super(CalcBlocInitial());

  var firstValue = 0;
  var secondVal = 0;
  String history = '';
  Operations? operation;
  String historyDatabase = '';
  bool isProgress = false;
  bool isClear = false;
  String textToDisplay = '';
  HistoryRepository historyRepository;

  //StreamController<String> streamCalcController = StreamController();

  void minusCalcController() {
    if (textToDisplay.contains('-')) {
      textToDisplay = textToDisplay.substring(1);
    } else {
      textToDisplay = ("-$textToDisplay");
    }
      emit(CalcBlocData(textToDisplay));
  }

  void addCalcController(String val) {
    if (isClear){
      textToDisplay ='';
      history = '';
      isClear = false;
    }
    textToDisplay = textToDisplay + val;
      emit(CalcBlocData(textToDisplay));
  }

  void clearCalcController() {
    textToDisplay = '';
    history = '';
    emit(CalcBlocData(textToDisplay));
  }

  void clearOneCalcController() {
    textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
    //streamCalcController.sink.add
    emit(CalcBlocData(textToDisplay));
  }

  void plus(firstVal) {
    operation = Operations.plus;
    firstValue = int.parse(firstVal);
    textToDisplay = '';
    emit(CalcBlocData(textToDisplay));
  }

  void subtract(firstVal) {
    operation = Operations.subtract;
    firstValue = int.parse(firstVal);
    textToDisplay = '';
    emit(CalcBlocData(textToDisplay));
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

    historyRepository.insertOperationDb(HistoryDb(
        operation: history,
        time: DateFormat('yyyy - MMMM - dd HH:mm:ss').format(DateTime.now()),
        isProgress: false));

    return result;
  }
}

enum Operations { plus, subtract, multiply, divide }
