import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_calculate/screens/history/weather_model.dart';
import '../../model/weather_forecast_daily.dart';
import 'weather_bloc_state.dart';
import 'weather_repository.dart';
import 'weather_wrapper.dart';

class WeatherBlocCubit extends Cubit<WeatherBlocState> {
  WeatherBlocCubit(this.weatherRepository) : super(WeatherBlocInitial());

  //StreamController<WeatherWrapper> streamController = StreamController();
  final WeatherRepository weatherRepository;



  Future<void> getWeatherObject() async {
    emit(LoadingState());

    try {
      WeatherForecast result = await weatherRepository.forecastObject();
      DateTime formattedDate = DateTime.fromMillisecondsSinceEpoch(
          result.list![0].dt! * 1000);
      String date = Util.getFormattedDate(formattedDate);
     // int hour = DateTime.now().hour;
      WeatherModel model = WeatherModel(
          city: result.city?.name ?? '',
          country: result.city?.country ?? '',
          temp: result.list?[0].main?.temp?.toStringAsFixed(0) ?? '0',
          date: date,
          icon: result.list?[0].getIconUrl() ?? '');
      // streamController.sink.add
      emit(DataState(WeatherWrapper(
        isProgress: false,
        objectWeather: model,
      )));
    } catch (e) {
      emit(ErrorState(e.toString()
      ));
    }
  }
// void dispose() {
//   streamController.close();// }
// int getQuoter(int hour){
//     switch(hour){
//       case 0:
//       case 1:
//       case 2:
//       case 3:
//       case 4:
//       case 5:
//       case 6:return 0;
//       case 7:
//       case 8:
//       case 9:
//       case 10:
//       case 11:
//       case 12:return 1;
//       case 13:
//       case 14:
//       case 15:
//       case 16:
//       case 17:
//       case 18:return 2;
//       case 19:
//       case 20:
//       case 21:
//       case 22:
//       case 23:
//       case 24:return 3;
//       default: return 0;
//     }
//}
}

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
}



