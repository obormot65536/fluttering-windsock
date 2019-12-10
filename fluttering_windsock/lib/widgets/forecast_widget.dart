import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_windsock/blocs/weather_bloc.dart';
import 'package:fluttering_windsock/states/weather_state.dart';
import 'package:fluttering_windsock/widgets/next_day_widget.dart';
import 'package:weather/weather.dart';

class ForecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, weatherState) {
      var forecast = weatherState.data.fiveDaysForecast;

      if (forecast == null || forecast.isEmpty)
        return Center(
          child: Text(
            'Forecast is not available',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        );
      else {
        List<Widget> widgets = getForecastWidgets(forecast);
        widgets.insert(0, SizedBox(width: 4));
        widgets.add(SizedBox(width: 4));
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgets,
        );
      }
    });
  }

  List<Widget> getForecastWidgets(List<Weather> forecast) {
    var map = groupBy(
        forecast,
        (Weather item) =>
            DateTime(item.date.year, item.date.month, item.date.day));

    List<Widget> widgets = [];
    map.removeWhere((k, v) => DateTime.now().isAfter(k));
    map.forEach((k, v) {
      int avgTemp = (v
                  .map((Weather e) => e.temperature.celsius.round())
                  .reduce((val, e) => val = val + e) /
              v.length)
          .round();
      var measurementDate = v[0].date;
      var temps =
          groupBy(v, (Weather item) => item.weatherIcon.substring(0, 2));
      var maxMeasurements = 0;
      var icon;
      temps.forEach((k, v) {
        if (v.length > maxMeasurements) {
          maxMeasurements = v.length;
          icon = k + 'd';
        }
      });
      widgets.add(NextDayWidget(
        temp: avgTemp,
        icon: icon,
        date: measurementDate,
      ));
    });
    return widgets;
  }
}
