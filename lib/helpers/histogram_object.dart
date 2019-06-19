class HistogramObject {
  int monday = 0;
  int tuesday = 0;
  int wednesday = 0;
  int thursday = 0;
  int friday = 0;
  int saturday = 0;
  int sunday = 0;
  HistogramObject(this.monday, this.tuesday, this.wednesday, this.thursday,
      this.friday, this.saturday, this.sunday);
  factory HistogramObject.noData() {
    return HistogramObject(0, 0, 0, 0, 0, 0, 0);
  }
}
