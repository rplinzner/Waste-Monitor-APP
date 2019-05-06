import 'package:flutter/material.dart';

class SomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/WasteMonitor_logo_big.png',
              scale: 4.6,
            ),
            Text(
              'some text',
              style: TextStyle(
                  color: Colors.orange,
                  fontFamily: 'Montserrat',
                  fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
