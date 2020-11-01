import 'dart:io';

import 'package:http/http.dart' as http;

class Api {
  String _url = "http://192.168.1.186:8000/api";

  fetchRoutes() async {
    var response;
    try {
      response = await http.get("$_url/routes");
      if (response.statusCode == 200) {
        return response;
      }
    } on Exception catch (e) {}
  }

  login(username, password) async {
    var response;
    try {
      response =
          await http.get("$_url/users?email=$username&password=$password");
      if (response.statusCode == 200) {
        return true;
      }
    } on SocketException catch (e) {
      print(e);
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
