import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttering_windsock/blocs/weather_bloc.dart';
import 'package:fluttering_windsock/events/refresh_event.dart';
import 'package:weather/weather.dart';

import 'forecast_widget.dart';
import 'location_widget.dart';
import 'next_day_widget.dart';
import 'today_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }

  Scaffold buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<WeatherBloc>(context).add(RefreshEvent.refresh);
            return Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(children: <Widget>[
            Card(
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  LocationWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  TodayWidget(),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Divider(
                      color: Theme.of(context).backgroundColor,
                      height: 2,
                    ),
                  ),
                  ForecastWidget(),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
