import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_windsock/events/refresh_event.dart';
import 'package:fluttering_windsock/repositories/weather_repository.dart';
import 'package:fluttering_windsock/states/weather_state.dart';

class WeatherBloc extends Bloc<RefreshEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(RefreshEvent event) async* {
    yield WeatherLoading();

    // TODO: Add proper error handling
    try {
      var weatherInfo = await weatherRepository.getWeather();
      yield WeatherLoaded(weatherInfo);
    } catch (e) {
      yield WeatherError(e.toString());
    }
  }
}
