import 'package:fluttering_windsock/models/weather_info.dart';

import 'data_state.dart';

class WeatherState {
  final DataState state;
  final WeatherInfo data;
  final String errorMessage;

  WeatherState(this.state, this.data, this.errorMessage);
}