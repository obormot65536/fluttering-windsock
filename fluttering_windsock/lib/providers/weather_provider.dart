import 'package:fluttering_windsock/models/weather_info.dart';
import 'package:weather/weather.dart';

class WeatherProvider {
  static const String API_KEY = "e1bc7ae1f7895f42d3c6349a2381f40f";

  static WeatherStation weatherStation = new WeatherStation(API_KEY);

  Future<WeatherInfo> fetchWeather() {
    Weather current;
    List<Weather> next;

    return weatherStation
        .currentWeather()
        .then((val) => current = val)
        .then((info) => weatherStation.fiveDayForecast())
        .then((val) => next = val)
        .then((_) => WeatherInfo(current, next, current.areaName,
            DateTime.now().millisecondsSinceEpoch));
  }
}
