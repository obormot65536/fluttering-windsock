import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BoxedIcon(
          WeatherIcons.day_sunny,
          size: 72,
        ),
        Text(
          '20°',
          style: TextStyle(
              fontStyle: Theme.of(context).textTheme.title.fontStyle,
              fontSize: 72),
        ),
      ],
    );
  }
}