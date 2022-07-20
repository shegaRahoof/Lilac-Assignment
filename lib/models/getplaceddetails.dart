import 'dart:developer';

class getplacedetails {
  late String ip;
  late String city;

  getplacedetails({required this.ip, required this.city});
  // required this.productid});

  factory getplacedetails.fromJson(Map<String, dynamic> json) {
    log("message1");

    return getplacedetails(
      ip: json["ip"],
      city: json["city"],
    );
  }
}
