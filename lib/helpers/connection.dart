import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'waste_object.dart';

class Connection {
  final String api = 'http://waste-monitor.azurewebsites.net/api/';

  Future<WasteObject> getLatestResponse() async {
    var uri = api + 'wastedata/latest';
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
    var uri = api + 'wastedata/refresh';
    return await http.get(uri).then((http.Response response) async {
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    });
  }
}
