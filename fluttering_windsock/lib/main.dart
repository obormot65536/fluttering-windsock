import 'package:flutter/material.dart';

import 'widgets/MainPage.dart';

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


