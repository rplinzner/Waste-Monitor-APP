import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as hhtp;
import 'dart:convert' as JSON;

class Connection {
  final String api = 'http://waste-monitor.azurewebsites.net/api/';

  Future<double> getLatestResponse() async {
    var uri = api + 'wastedata/latest';
    return await hhtp.get(uri).then((hhtp.Response response) async {
      print(JSON.jsonDecode(response.body));
      var data = JSON.jsonDecode(response.body);
      double va = data['fillingLevel'];
      return va;
    });
    // var request = await  HttpClient().getUrl(Uri.parse(uri));
    // var response = await request.close();
  }

  Future<double> getLatestFilledLevel() {}
}
