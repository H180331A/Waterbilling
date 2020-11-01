import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String _url = "http://192.168.1.125:81/api";

  login(username, password) async {
    var response;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    try {
      response = await http.post("$_url/login", body: {
        "email": username,
        "password": password,
        "device_name":
            "${androidDeviceInfo.brand}-${androidDeviceInfo.product}-${androidDeviceInfo.model}",
      });
      if (response.statusCode == 200) {
        _prefs.setString("token", json.decode(response.body)["token"]);
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      print(e);
    }
  }

  fetchRoute() async {
    var response;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString("token");
    try {
      response = await http.get("$_url/routes?api_token=$token",
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        print(response);
        return json.decode(response.body);
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  meter(meternumber, accountno, accountname, homeaddress, model,
      previousreading, currentreading) async {
    var response;
    try {
      response = await http.get(
          "$_url/meter?meter_number=$meternumber&accountno=$accountname&homeaddress=$homeaddress&model=$model&previousreding=$previousreading&currentreading=$currentreading");

      if (response.statusCode == 200) {
        return true;
      }
    } on SocketException catch (e) {
      print(e);
    }
  }
}
