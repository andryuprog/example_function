import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static late final WEATHER_APP_ID;
  static const String WEATHER_BASE_SCHEME = 'https://';
  static const String WEATER_BASE_URL_DOMAIN = 'api.openweathermap.org';
  static const String WEATHE_FORECAST_PATH = '/data/2.5/forecast';
  static const String WEATHE_IMAGES_PATH = '/img/w/';
  static const String WEATHE_IMAGES_URL =
      WEATHER_BASE_SCHEME + WEATER_BASE_URL_DOMAIN + WEATHE_IMAGES_PATH;

  static void loadEnv() {
    WEATHER_APP_ID = dotenv.env['OPENWEATHERMAP_API_KEY'] ?? '';
  }
}
