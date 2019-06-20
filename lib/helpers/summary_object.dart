import 'months_enum.dart';

class SummaryObject {
  //String month;
  DateTime month;
  int weight;
  SummaryObject(int month, this.weight) {
    //this.month = Months.values[month-1].toString().split('.').last;
    //TODO: add year
    this.month = DateTime(2018, month = month);
  }
}
