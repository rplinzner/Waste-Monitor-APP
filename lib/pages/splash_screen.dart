import 'dart:async';

import 'package:flutter/material.dart';
import '../helpers/data_extractor.dart';
import 'navigation.dart';
import 'home_page.dart';
import '../helpers/histogram_object.dart';
import '../helpers/summary_object.dart';
import '../helpers/connection.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DataExtractor _dataExtractor = DataExtractor();

  @override
  void initState() {
    super.initState();
    //TODO: Adjust Splash Screen Duration accordingly
    Timer(Duration(seconds: 3), () => callHomeScreen());
  }

  callHomeScreen() async {
    HistogramObject histogram;
    List<SummaryObject> summaries;

    // _dataExtractor.connection.getHistogramData().then((value) {
    //   histogram = value;
    // });
    // _dataExtractor.connection.getSummaryObjects().then((value1) {
    //   summaries = value1;
    // });
    histogram = await _dataExtractor.connection.getHistogramData();
    summaries = await _dataExtractor.connection.getSummaryObjects();

    _dataExtractor.getLatestWasteLevel().then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Navigation(
                    initialFillValue: value,
                    histogramObject: histogram,
                    connection: _dataExtractor.connection,
                    summaries: summaries,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.green),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/WasteMonitor_logo_big.png',
                      scale: 4.6,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                    ),
                    Text(
                      'WasteMonitor',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Text(
                    'More than just trash',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
