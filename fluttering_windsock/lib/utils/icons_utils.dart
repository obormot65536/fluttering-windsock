import 'package:flutter/src/widgets/icon_data.dart';
import 'package:weather_icons/weather_icons.dart';

class IconsUtils {
  static IconData get(String id) {
    switch (id) {
      case '01d':
        return WeatherIcons.day_sunny;
      case '01n':
        return WeatherIcons.night_clear;
      case '02d':
        return WeatherIcons.day_sunny_overcast;
      case '02n':
        return WeatherIcons.night_alt_partly_cloudy;
      case '03d':
        return WeatherIcons.day_cloudy_gusts;
      case '03n':
        return WeatherIcons.night_alt_cloudy_gusts;
      case '04d':
        return WeatherIcons.day_cloudy;
      case '04n':
        return WeatherIcons.night_cloudy;
      case '09d':
        return WeatherIcons.day_showers;
      case '09n':
        return WeatherIcons.night_showers;
      case '10d':
        return WeatherIcons.day_rain;
      case '10n':
        return WeatherIcons.night_rain;
      case '11d':
        return WeatherIcons.day_thunderstorm;
      case '11n':
        return WeatherIcons.night_thunderstorm;
      case '13d':
        return WeatherIcons.day_snow;
      case '13n':
        return WeatherIcons.night_snow;
      case '50d':
        return WeatherIcons.day_fog;
      case '50n':
        return WeatherIcons.night_fog;
      default:
        return WeatherIcons.thermometer;
    }
  }
}
