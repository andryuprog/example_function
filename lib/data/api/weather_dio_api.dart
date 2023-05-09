
import 'package:dio/dio.dart';
import '../model/weather_forecast_daily.dart';
import '../utilities/constants.dart';

class WeatherApi {
  final dio = Dio();

  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {

    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var response = await dio.get("${Constants.WEATHER_BASE_SCHEME}${Constants.WEATER_BASE_URL_DOMAIN}"
        "${Constants.WEATHE_FORECAST_PATH}",queryParameters: queryParameters);// запрос

   // print('response: показать погоду ${response.data}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(response.data);
    } else {
      throw Exception('Error response');
    }
  }
}