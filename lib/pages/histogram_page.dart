import 'package:flutter/material.dart';
import '../helpers/histogram_object.dart';

class HistogramPage extends StatelessWidget {
  HistogramObject data = HistogramObject.noData();
  HistogramPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Frequency of bin emptying',
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
