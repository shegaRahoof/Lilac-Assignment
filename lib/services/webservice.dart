import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:lilac_assignmnt_app/models/weatherModel.dart';

class Webservice {
  String baseurl = "http://api.weatherapi.com/v1/current.json";

  Future<Map<String, dynamic>> getWeatherDetails(String city) async {
    var result;
    var apikey = "c0dbb6f1794640eeabf103014222805";

    final Map<String, dynamic> Weatherdetails = {
      'key': apikey,
      'q': city,
      'aqi': 'yes',
    };
    print(Weatherdetails.toString());

    try {
      final response =
          await http.post(Uri.parse(baseurl), body: Weatherdetails);

      if (response.statusCode == 200) {
        print("Status code==" + response.statusCode.toString());
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Printtt");
        var productData = responseData;
        result = {
          'status': true,
          'message': 'successful',
          'productData': productData
        };
        WeatherModel authUser = WeatherModel.fromJson(productData);

        print("modelll :");
        result = {
          'status': true,
          'message': 'successful',
          'productData': authUser
        };
        print(">>>>>>>>>>>>>>>>>>>>>hellloo");
      } else {
        result = {
          'status': false,
          'message': json.decode(response.body)['error']
        };
        print("heooooo>>>>>>>>>>");
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
