import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_windsock/blocs/weather_bloc.dart';
import 'package:fluttering_windsock/providers/weather_provider.dart';
import 'package:fluttering_windsock/repositories/weather_repository.dart';

import 'blocs/logging_delegate.dart';
import 'widgets/main_page.dart';

void main() {
  BlocSupervisor.delegate = LoggingDelegate();

  final WeatherRepository weatherRepository =
      WeatherRepository(weatherProvider: WeatherProvider());

  runApp(WindsockApp(weatherRepository));
}

class WindsockApp extends StatelessWidget {
  WindsockApp(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Windstock',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepOrange,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: BlocProvider(
          create: (context) => WeatherBloc(weatherRepository: _weatherRepository),
          child: MainPage(title: 'Windsock'),
        ));
  }
}
