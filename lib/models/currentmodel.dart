// ignore: camel_case_types
import 'dart:developer';

class CurrentModel {
  int last_updated_epoch;
  String last_updated;

  double temp_c;

  double temp_f;
  int is_day;

  double wind_mph;
  double wind_kph;
  int wind_degree;
  String wind_dir;
  double pressure_mb;
  double pressure_in;
  double precip_mm;
  double precip_in;
  int humidity;
  int cloud;
  double feelslike_c;
  double feelslike_f;
  double vis_km;
  double vis_miles;
  double uv;
  double gust_mph;
  double gust_kph;

  CurrentModel({
    required this.last_updated_epoch,
    required this.last_updated,
    required this.temp_c,
    required this.temp_f,
    required this.is_day,
    required this.wind_mph,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.pressure_in,
    required this.precip_mm,
    required this.precip_in,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.vis_km,
    required this.vis_miles,
    required this.uv,
    required this.gust_mph,
    required this.gust_kph,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    log("current==" + json["last_updated_epoch"].toString());
    return CurrentModel(
      last_updated_epoch: json["last_updated_epoch"],
      last_updated: json["last_updated"],
      temp_c: json["temp_c"],
      temp_f: json["temp_f"],
      is_day: json["is_day"],
      wind_mph: json["wind_mph"],
      wind_kph: json["wind_kph"],
      wind_degree: json["wind_degree"],
      wind_dir: json["wind_dir"],
      pressure_mb: json["pressure_mb"],
      pressure_in: json["pressure_in"],
      precip_mm: json["precip_mm"],
      precip_in: json["precip_in"],
      humidity: json["humidity"],
      cloud: json["cloud"],
      feelslike_c: json["feelslike_c"],
      feelslike_f: json["feelslike_f"],
      vis_km: json["vis_km"],
      vis_miles: json["vis_miles"],
      uv: json["uv"],
      gust_mph: json["gust_mph"],
      gust_kph: json["gust_kph"],
    );
  }

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': last_updated_epoch,
        'last_updated': last_updated,
        'temp_c': temp_c,
        'temp_f': temp_f,
        'is_day': is_day,
        'wind_mph': wind_mph,
        'wind_kph': wind_kph,
        'wind_degree': wind_degree,
        'wind_dir': wind_dir,
        'pressure_mb': pressure_mb,
        'pressure_in': pressure_in,
        'precip_mm': precip_mm,
        'precip_in': precip_in,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslike_c,
        'feelslike_f': feelslike_f,
        'vis_km': vis_km,
        'vis_miles': vis_miles,
        'uv': uv,
        'gust_mph': gust_mph,
        'gust_kph': gust_kph,
      };
}
