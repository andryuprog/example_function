import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/weather_forecast_daily.dart';
import '../utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATER_BASE_URL_DOMAIN,
        Constants.WEATHE_FORECAST_PATH, queryParameters);

    log('reauest : ${uri.toString()}');

    var response = await http.get(uri);

    print('response: показать погоду ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
