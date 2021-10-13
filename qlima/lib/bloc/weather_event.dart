part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeeather extends WeatherEvent {
  final String cityName;

  const GetWeeather(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
class GetDetailedWeeather extends WeatherEvent {
  final String cityName;

  const GetDetailedWeeather(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
