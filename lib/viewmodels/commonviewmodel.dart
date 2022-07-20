import 'package:flutter/cupertino.dart';
import 'package:lilac_assignmnt_app/services/webservice.dart';

class commonviewmodel extends ChangeNotifier {
  Map<String, dynamic>? productDetails;

  Future<Map<String, dynamic>> getWeatherDetail(String city) async {
    productDetails = await Webservice().getWeatherDetails(city);
    return productDetails!;
  }
}
