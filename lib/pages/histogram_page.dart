import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../helpers/histogram_object.dart';

class HistogramPage extends StatelessWidget {
  HistogramObject data;
  HistogramPage({this.data});
  List<DayData> entries = List<DayData>();
  final bool animate = true;

  List<charts.Series<DayData, String>> generateEntries() {
    if (data == null) data = HistogramObject();
    entries.add(DayData("Mon", data.monday));
    entries.add(DayData("Tue", data.tuesday));
    entries.add(DayData("Wed", data.wednesday));
    entries.add(DayData("Thu", data.thursday));
    entries.add(DayData("Fri", data.friday));
    entries.add(DayData("Sat", data.saturday));
    entries.add(DayData("Sun", data.sunday));
    return [
      new charts.Series<DayData, String>(
        id: 'Empties',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DayData day, _) => day.dayName,
        measureFn: (DayData day, _) => day.count,
        data: entries,
      )
    ];
  }

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
                      fontSize: 23.0),
                )),
            Text(
              'from previous month',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
            ),
            Expanded(
              child: charts.BarChart(
                generateEntries(),
                animate: animate,
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}

class DayData {
  final String dayName;
  final int count;
  DayData(this.dayName, this.count);
}
