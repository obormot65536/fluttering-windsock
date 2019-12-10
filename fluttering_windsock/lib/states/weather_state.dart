import 'package:fluttering_windsock/models/weather_info.dart';
import 'package:weather/weather.dart';

import 'data_state.dart';

class WeatherState {
  static final WeatherInfo EMPTY_INFO = WeatherInfo(
    Weather({
      'weather': [null]
    }),
    [],
    '',
    0,
  );

  final DataState state;
  final WeatherInfo data;
  final String errorMessage;

  WeatherState(this.state, this.data, this.errorMessage);
}

class WeatherEmpty extends WeatherState {
  WeatherEmpty() : super(DataState.empty, WeatherState.EMPTY_INFO, null);
}

class WeatherLoading extends WeatherState {
  WeatherLoading() : super(DataState.loading, WeatherState.EMPTY_INFO, null);
}

class WeatherLoaded extends WeatherState {
  WeatherLoaded(WeatherInfo info) : super(DataState.loaded, info, null);
}

class WeatherError extends WeatherState {
  WeatherError(String message) : super(DataState.error, WeatherState.EMPTY_INFO, message);
}