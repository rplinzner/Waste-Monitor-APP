import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'waste_object.dart';
import 'histogram_object.dart';
import 'summary_object.dart';

class Connection {
  final String api = 'http://waste-monitor.azurewebsites.net/api/wastedata/';

  Future<WasteObject> getLatestResponse() async {
    var uri = api + 'latest';
    return await http.get(uri).then((http.Response response) async {
      print(JSON.jsonDecode(response.body));
      var data = JSON.jsonDecode(response.body);
      var temp = WasteObject(
          id: data['id'],
          dateTime: data['dateTime'],
          weight: data['weight'],
          filledLevel: data['fillingLevel']);
      return temp;
    });
  }

  Future<bool> refresh() async {
    var uri = api + 'refresh';
    return await http.get(uri).then((http.Response response) async {
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    });
  }

  Future<HistogramObject> getHistogramData() async {
    var uri = api + 'histogram';
    return await http.get(uri).then((http.Response response) async {
      print(JSON.jsonDecode(response.body));
      var data = JSON.jsonDecode(response.body);
      var temp = HistogramObject(
          monday: data['Monday'],
          tuesday: data['Tuesday'],
          wednesday: data['Wednesday'],
          thursday: data['Thursday'],
          friday: data['Friday'],
          saturday: data['Saturday'],
          sunday: data['Sunday']);
      return temp;
    });
  }

  Future<List<SummaryObject>> getSummaryObjects() async {
    var uri = api + 'summary';
    return await http.get(uri).then((http.Response response) async {
      print(JSON.jsonDecode(response.body));
      var data = JSON.jsonDecode(response.body);
      List<SummaryObject> ret = List<SummaryObject>();
      for (var item in data) {
        ret.add(SummaryObject(item['item1'], item['item2'], item['item3']));
      }
      return ret;
    });
  }
}
