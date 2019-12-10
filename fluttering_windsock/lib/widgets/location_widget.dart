import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_windsock/blocs/weather_bloc.dart';
import 'package:fluttering_windsock/states/weather_state.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, weatherState) {
      var weather = weatherState.data.currentWeather;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Theme.of(context).textTheme.display1.color,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              (weather.areaName.isNotEmpty) ? weather.areaName : "Unknown",
                style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      );
    });
  }
}
