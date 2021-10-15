import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qlima/data/model/weather.dart';
import 'package:qlima/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      emit(WeatherLoading());

      if (event is GetWeather) {
        try {
          final weather = weatherRepository.fetchWeather(event.cityName).then((weather) => emit(WeatherLoaded(weather)));
        } on NetworkError {
          emit(WeatherError("Couldn't feetch weather! Is the device online?"));
        }
      } else if (event is GetDetailedWeather) {
        try {
          final weather = weatherRepository.fetchDetailedWeather(event.cityName).then((weather) => emit(WeatherLoaded(weather)));
        } on NetworkError {
          emit(WeatherError("Couldn't feetch weather! Is the device online?"));
        }
      }
    });
  }
}
