
import 'package:flutter/material.dart';
import 'package:flutter_api_weather/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Repository/repository_weather.dart';
import 'bloc/weather_bloc.dart';
import 'bloc_observer.dart';
import 'package:http/http.dart' as http;

import 'model/api.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(weatherRepository: weatherRepository));

}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather',
      home: BlocProvider(
        create: (context) =>
            WeatherBloc(weatherRepository: weatherRepository),
        child: Widgets(),
      ),
    );
  }
}
