import 'package:flutter/material.dart';

import './pages/home_page.dart';

void main() => runApp(MainWindow());

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
      theme: ThemeData(
          accentColor: Colors.orangeAccent,
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.light),
      title: 'Waste Monitor',
    );
  }
}
