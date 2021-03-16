import 'package:flutter/material.dart';
import 'package:flutter_api_weather/model/model.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditions({Key key, @required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapCondition(condition);

   _mapCondition(WeatherCondition condition) {

    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
          return Text("Clear" ,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),);

      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
      return Text("Winter",style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),);

      case WeatherCondition.heavyCloud:
        return Text("Cloudy",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),);

      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
      return Text("Monsoon", style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,

      ),);

      case WeatherCondition.thunderstorm:
        return Text("thunderstorm",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),);

      case WeatherCondition.unknown:
        return Text('unknown',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),);
    }
  }
}
