import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_windsock/blocs/weather_bloc.dart';
import 'package:fluttering_windsock/states/weather_state.dart';
import 'package:fluttering_windsock/utils/icons_utils.dart';
import 'package:fluttering_windsock/utils/string_utils.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, weatherState) {
        var weather = weatherState.data.currentWeather;
        return Column(
          children: <Widget>[
            Center(
              child: Text(
                StringUtils.capitalize(weather.weatherDescription),
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BoxedIcon(
                  IconsUtils.get(weather.weatherIcon),
                  size: 72,
                ),
                Text(
                  '${(weather.temperature.kelvin != 0) ? weather.temperature.celsius.round() : 'N/A'}°C',
                  style: TextStyle(
                      fontStyle: Theme.of(context).textTheme.title.fontStyle,
                      fontSize: 72),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
