class SummaryObject {
  //String month;
  DateTime date;
  double weight;
  SummaryObject(int month, this.weight, int year) {
    //this.month = Months.values[month-1].toString().split('.').last;
    this.date = DateTime(year, month = month);
  }
}
