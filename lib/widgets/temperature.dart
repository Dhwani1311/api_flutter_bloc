import 'package:flutter/material.dart';
import 'package:flutter_api_weather/model/api.dart';

class Temperature extends StatelessWidget {

  final double temperature;
  // final double low;
  // final double high;

  Temperature({
    Key key,
    this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _formattedTemp(double t) => t.round();
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemp(temperature)}°',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
             // color: Colors.white,
            ),
          ),
        ),
        // Column(
        //   children: [
        //     Text(
        //       'max: ${_formattedTemperature(high)}°',
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w100,
        //         color: Colors.white,
        //       ),
        //     ),
        //     Text(
        //       'min: ${_formattedTemperature(low)}°',
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w100,
        //         color: Colors.white,
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }


}
