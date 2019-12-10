import 'package:weather/weather.dart';

class WeatherInfo {
  final Weather currentWeather;
  final List<Weather> fiveDaysForecast;
  final String location;
  final int timestamp;

  WeatherInfo(this.currentWeather, this.fiveDaysForecast, this.location,
      this.timestamp);
}
