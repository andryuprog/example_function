import 'dart:async';

import 'package:intl/intl.dart';
import 'package:my_calculate/screens/history/weather_model.dart';
import 'package:my_calculate/widgets/temp_view.dart';
import '../../model/weather_forecast_daily.dart';
import 'weather_repository.dart';
import 'weather_wrapper.dart';

class WeatherBlockH {

  StreamController<WeatherWrapper> streamController = StreamController();
  final WeatherRepository weatherRepository;
  WeatherBlockH(this.weatherRepository);


  Future<void> getWeatherObject() async {
    streamController.sink.add(WeatherWrapper(
      isProgress: true,
    ));

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
      streamController.sink.add(WeatherWrapper(
       isProgress: false,
        objectWeather: model,
     ));
    } catch (e) {
      streamController.sink.add(WeatherWrapper(
        isProgress: false,
        error: e.toString()
      ));
    }
  }
  void dispose() {
    streamController.close();
  }
}

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
}

