// ignore: camel_case_types
import 'dart:developer';

class LocationModel {
  String name;
  String region;

  String country;

  double lat;
  double lon;
  String tz_id;
  String localtime_epoch;
  String localtime;

  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    log("name===" + json["name"].toString());
    log("region===" + json["region"].toString());
    log("country===" + json["country"].toString());
    log("lat===" + json["lat"].toString());
    log("lon===" + json["lon"].toString());
    log("tz_id===" + json["tz_id"].toString());
    log("localtime_epoch===" + json["localtime_epoch"].toString());
    log("localtime===" + json["localtime"].toString());

    return LocationModel(
      name: json["name"],
      region: json["region"],
      country: json["country"],
      lat: json["lat"],
      lon: json["lon"],
      tz_id: json["tz_id"],
      localtime_epoch: json["localtime_epoch"].toString(),
      localtime: json["localtime"],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tz_id,
        'localtime_epoch': localtime_epoch,
        'localtime': localtime,
      };
}
