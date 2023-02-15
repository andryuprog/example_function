
import '../../api/weather_dio_api.dart';
import '../../model/weather_forecast_daily.dart';

const String cityName = 'Dnipro';

class WeatherRepository {

      final WeatherApi weatherApi;

      WeatherRepository (this.weatherApi);

   Future<WeatherForecast> forecastObject() async {
 return WeatherApi().fetchWeatherForecastWithCity(cityName: cityName);
 }


}