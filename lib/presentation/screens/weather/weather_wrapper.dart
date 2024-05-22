import 'package:my_calculate/domain/entities/weather_model.dart';

class WeatherWrapper {
  WeatherModel? objectWeather;
  bool isProgress;
  String? error;

  WeatherWrapper({this.objectWeather, required this.isProgress, this.error});
}
