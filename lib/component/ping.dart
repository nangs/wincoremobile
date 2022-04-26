// ignore_for_file: avoid_print

import 'dart:async';
import 'package:wincoremobile/api/globals.dart' as globals;
import 'package:flutter/services.dart';
import 'package:wincoremobile/api/api_rest.dart';
import 'dart:convert' as convert;

class Ping {
  static String _pingStatus = 'Unknown';

  static Future<String> initPing() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      var body = {'win_token': 'wincore'};
      var response = await ApiRest.ping(body);

      //print(response.body);
      if (response != null) {
        var jsonData = convert.jsonDecode(response.body);
        if (jsonData['request_token'] != "") {
          _pingStatus = "OK";
        }
      }
    } on PlatformException catch (e) {
      globals.isError = true;
      print(e.toString());
    }

    return _pingStatus;
  }
}
