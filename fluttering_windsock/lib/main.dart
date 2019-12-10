import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_windsock/blocs/weather_bloc.dart';

import 'blocs/logging_delegate.dart';
import 'widgets/main_page.dart';

void main() {
  BlocSupervisor.delegate = LoggingDelegate();
  runApp(WindsockApp());
}

class WindsockApp extends StatelessWidget {
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
          create: (context) => WeatherBloc(),
          child: MainPage(title: 'Windsock'),
        ));
  }
}
