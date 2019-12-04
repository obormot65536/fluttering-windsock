import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather/weather.dart';

void main() => runApp(WindsockApp());

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
      home: MainPage(title: 'Windsock'),
    );
  }
}

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BoxedIcon(
                  WeatherIcons.day_sunny,
                  size: 72,
                ),
                Text(
                  '20°',
                  style: TextStyle(
                      fontStyle: Theme.of(context).textTheme.title.fontStyle,
                      fontSize: 72),
                ),
              ],
            ),
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

class NextDayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NextDayWidgetState();
}

class _NextDayWidgetState extends State<NextDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Text(
              'Wed, 4 Dec',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,

              ),
            ),
            BoxedIcon(
              WeatherIcons.day_sunny,
              size: 32,
            ),
            Text(
              '20°',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.title.fontStyle,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
