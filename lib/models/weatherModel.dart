// ignore: camel_case_types
import 'package:lilac_assignmnt_app/models/currentmodel.dart';
import 'package:lilac_assignmnt_app/models/location.dart';

class WeatherModel {
  LocationModel locate;
  CurrentModel current;

  WeatherModel({
    required this.locate,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    LocationModel? authUser;
    LocationModel locate;

    print("inside location model== " + json['location'].toString());

    if (json['location'] != null) {
      var objlocation = json['location'];
      authUser = LocationModel.fromJson(json['location']);

      print("location :" + authUser.country.toString());

      /*locate =
          objlocation.map((featureJson) => LocationModel.fromJson(featureJson));
      print("inside location== " + locate.name.toString());*/
    }

    late CurrentModel authUser2;
    CurrentModel current;
    print("inside current model== " + json['current'].toString());
    if (json['current'] != null) {
      var objcurrent = json['current'];

      authUser2 = CurrentModel.fromJson(json['current']);

/*      current =
          objcurrent.map((featureJson) => CurrentModel.fromJson(featureJson));
          */

      print("inside current==" + authUser2.gust_kph.toString());

      // current = objcurrent.Map.map(
      //         (featureJson) => CurrentModel.fromJson(featureJson))
      //     .cast<String, dynamic>();
    }

    WeatherModel w = WeatherModel(locate: authUser!, current: authUser2);

    print("Location =" + w.locate.country.toString());
    /*return WeatherModel(
      locate: json["location"],
      current: json["current"],
    );*/

    return w;
  }

  // Map<String, dynamic> toJson() => {
  //       'locate': locate,
  //       'current': current,
  //     };
}
