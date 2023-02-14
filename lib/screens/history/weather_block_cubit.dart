import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_calculate/screens/history/weather_model.dart';
import '../../model/weather_forecast_daily.dart';
import 'weather_bloc_state.dart';
import 'weather_repository.dart';
import 'weather_wrapper.dart';

class WeatherBlocCubit extends Cubit<WeatherBlocState> {
  WeatherBlocCubit(this.weatherRepository) : super(WeatherBlocInitial()){
    getWeatherObject();
  }

  final WeatherRepository weatherRepository;



  Future<void> getWeatherObject() async {
    emit(LoadingState());

    try {
      WeatherForecast result = await weatherRepository.forecastObject();
      DateTime formattedDate = DateTime.fromMillisecondsSinceEpoch(
          result.list![0].dt! * 1000);
      String date = Util.getFormattedDate(formattedDate);
      WeatherModel model = WeatherModel(
          city: result.city?.name ?? '',
          country: result.city?.country ?? '',
          temp: result.list?[0].main?.temp?.toStringAsFixed(0) ?? '0',
          date: date,
          icon: result.list?[0].getIconUrl() ?? '');
      emit(DataState(WeatherWrapper(
        isProgress: false,
        objectWeather: model,
      )));
    } catch (e) {
      emit(ErrorState(e.toString()
      ));
    }
  }
}

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
}



