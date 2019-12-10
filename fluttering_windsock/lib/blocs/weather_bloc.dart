import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttering_windsock/events/refresh_event.dart';
import 'package:fluttering_windsock/models/weather_info.dart';
import 'package:fluttering_windsock/states/data_state.dart';
import 'package:fluttering_windsock/states/weather_state.dart';
import 'package:weather/weather.dart';

class WeatherBloc extends Bloc<RefreshEvent, WeatherState> {
  static const String API_KEY = "e1bc7ae1f7895f42d3c6349a2381f40f";

  static WeatherStation weatherStation = new WeatherStation(API_KEY);

  @override
  WeatherState get initialState => WeatherState(
      DataState.empty,
      WeatherInfo(
        Weather({
          'weather': [null]
        }),
        [],
        '',
        0,
      ),
      null);

  Future<Weather> async1() async {
    await Future<Weather>.delayed(const Duration(seconds: 1));
    return Weather({
      'weather': [null]
    });
  }

  Future<List<Weather>> async2() async {
    await Future<List<Weather>>.delayed(const Duration(seconds: 2));
    return List<Weather>();
  }

  @override
  Stream<WeatherState> mapEventToState(RefreshEvent event) async* {
    Weather current;
    List<Weather> next;
    yield await weatherStation
        .currentWeather()
        .then((val) => current = val)
        .then((info) => weatherStation.fiveDayForecast())
        .then((val) => next = val)
        .then((_) => WeatherState(
            DataState.loaded,
            WeatherInfo(current, next, current.areaName,
                DateTime.now().millisecondsSinceEpoch),
            null));
  }
}
