import 'package:flutter/material.dart';
import 'package:fluttering_windsock/models/weather_info.dart';
import 'package:fluttering_windsock/providers/weather_provider.dart';

// TODO: Add persistence logic.
class WeatherRepository {
  final WeatherProvider weatherProvider;

  WeatherRepository({@required this.weatherProvider})
      : assert(weatherProvider != null);

  Future<WeatherInfo> getWeather() async {
    return weatherProvider.fetchWeather();
  }
}
