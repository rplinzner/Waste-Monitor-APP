import 'connection.dart';
import 'waste_object.dart';

class DataExtractor {
  var connection = Connection();
  Future<double> getLatestWasteLevel() {
    return connection.getLatestResponse().then((value) {
      return value.filledLevel;
    });
  }
}
