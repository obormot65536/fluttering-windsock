import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class NextDayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NextDayWidgetState();
}

class _NextDayWidgetState extends State<NextDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Text(
              'Wed, 4 Dec',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,

              ),
            ),
            BoxedIcon(
              WeatherIcons.day_sunny,
              size: 32,
            ),
            Text(
              '20°',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.title.fontStyle,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}