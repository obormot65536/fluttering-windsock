import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import 'NextDayWidget.dart';
import 'TodayWidget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  final String API_KEY = "e1bc7ae1f7895f42d3c6349a2381f40f";

  WeatherStation weatherStation = new WeatherStation("YOUR_API_KEY");

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).textTheme.display1.color,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Location',
//                        Theme.of(context).textTheme.display1),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'Sunny',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            TodayWidget(),
            Container(
              margin: EdgeInsets.all(8),
              child: Divider(
                color: Theme.of(context).backgroundColor,
                height: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 4),
                NextDayWidget(),
                NextDayWidget(),
                NextDayWidget(),
                NextDayWidget(),
                NextDayWidget(),
                SizedBox(width: 4),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}