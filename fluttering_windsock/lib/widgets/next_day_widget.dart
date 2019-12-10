import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_windsock/utils/icons_utils.dart';
import 'package:weather_icons/weather_icons.dart';

class NextDayWidget extends StatelessWidget {
  static var formatter = new DateFormat('E, d MMM');
  final DateTime date;
  final String icon;
  final int temp;

  const NextDayWidget({Key key, this.date, this.icon, this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateString = formatter.format(date);
    var splitIndex = dateString.lastIndexOf(" ");
    dateString = dateString.substring(0, splitIndex) +
        '\n' +
        dateString.substring(splitIndex);

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Text(
              '$dateString',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BoxedIcon(
                IconsUtils.get(icon),
                size: 32,
              ),
            ),
            Text(
              '$temp°',
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
