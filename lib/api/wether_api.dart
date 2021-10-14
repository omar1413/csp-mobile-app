import 'dart:convert';

import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';

import '../constant.dart';

import 'package:http/http.dart' as http;

class WetherApi {
  static String API_KEY = "4c643cae989cd2e773ac0065f1459bbb";
  static getWetherData(double lat, double lon) {
    Uri url = Uri.https("api.openweathermap.org",
        "/data/2.5/weather?lat=$lat&lon=$lon&lang=ar&appid=$API_KEY");
  }
}
