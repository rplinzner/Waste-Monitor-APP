import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class SomePage extends StatelessWidget {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/WasteMonitor_logo_big.png',
              scale: 4.6,
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'some text',
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Montserrat',
                      fontSize: 25.0),
                )),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              width: 300,
              height: 200,
              child: Sparkline(
                data: data,
                lineColor: Colors.purpleAccent,
                lineWidth: 4.0,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange[900], Colors.orange[300]]),
                pointsMode: PointsMode.all,
                pointSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
