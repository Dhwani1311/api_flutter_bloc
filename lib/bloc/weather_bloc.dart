
export 'bloc_state.dart';
export 'weather_event.dart';

import 'package:flutter_api_weather/Repository/repository_weather.dart';
import 'package:flutter_api_weather/bloc/bloc_state.dart';
import 'package:flutter_api_weather/bloc/weather_event.dart';
import 'package:flutter_api_weather/model/api.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if (event is  WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
