import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/splash_screen.dart';
import './pages/navigation.dart';

void main() => runApp(MainWindow());

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/navigation': (context) => Navigation(),
        '/home': (context) => HomePage()
      },
      theme: ThemeData(
          accentColor: Colors.orangeAccent,
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.light),
      title: 'Waste Monitor',
    );
  }
}
