import 'dart:developer';

class ipget {
  late String ip;

  ipget({required this.ip});

  factory ipget.fromJson(Map<String, dynamic> json) {
    log("message1");

    return ipget(
      ip: json["ip"],
    );
  }
}
