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
 final WeatherWrapper data;

  const DataState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends WeatherBlocState {
  final String error;

  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
