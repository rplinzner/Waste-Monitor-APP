import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../helpers/summary_object.dart';

class WasteSummary extends StatelessWidget {
  final List<SummaryObject> data;
  List<charts.LineAnnotationSegment> annotations =
      List<charts.LineAnnotationSegment>();
  //final bool animate = true;
  WasteSummary(this.data);

  @override
  Widget build(BuildContext context) {
    // for (var item in data) {
    //   annotations.add(charts.LineAnnotationSegment(
    //     item.month,
    //     charts.RangeAnnotationAxisType.domain,
    //     startLabel: item.month.month.toString(),
    //     labelDirection: charts.AnnotationLabelDirection.horizontal,
    //   ));
    // }

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
                'Waste of weight monthly',
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'Montserrat',
                    fontSize: 23.0),
              ),
            ),
            Text('from last 10 months including current one',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 15)),
            Expanded(
              child:
                  // charts.LineChart(_getData(),
                  //     defaultRenderer: new charts.LineRendererConfig(
                  //         includeArea: true, stacked: true),
                  //     animate: true),
                  charts.TimeSeriesChart(
                _getData(),
                animate: true,
                behaviors: [
                  new charts.ChartTitle('kg of waste',
                      behaviorPosition: charts.BehaviorPosition.start,
                      titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                ],
                //behaviors: [charts.RangeAnnotation(annotations)],
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  List<charts.Series<SummaryObject, DateTime>> _getData() {
    return [
      new charts.Series<SummaryObject, DateTime>(
        id: 'Summary',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        // areaColorFn specifies that the area skirt will be light blue.
        areaColorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (SummaryObject summary, _) => summary.month,
        measureFn: (SummaryObject summary, _) => summary.weight,
        data: data,
      )
    ];
  }
  // List<charts.Series<SummaryObject, String>> _getData() {
  //   return [
  //     new charts.Series<SummaryObject, String>(
  //       id: 'Summary',
  //       // colorFn specifies that the line will be blue.
  //       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //       // areaColorFn specifies that the area skirt will be light blue.
  //       areaColorFn: (_, __) =>
  //           charts.MaterialPalette.blue.shadeDefault.lighter,
  //       domainFn: (SummaryObject summary, _) => summary.month,
  //       measureFn: (SummaryObject summary, _) => summary.weight,
  //       data: data,
  //     )
  //   ];
  // }
}
