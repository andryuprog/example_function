

import 'package:equatable/equatable.dart';
import 'package:my_calculate/presentation/screens/weather/weather_wrapper.dart';


abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();
}

class WeatherBlocInitial extends WeatherBlocState {
  @override
  List<Object> get props => [];
}

class LoadingState extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

class DataState extends WeatherBlocState {
  WeatherWrapper data;
  DataState(this.data);

  @override
  List<Object?> get props => [data];

}

class ErrorState extends WeatherBlocState {
  String error;
  ErrorState(this.error);
  @override
  List<Object?> get props => [error];

}
