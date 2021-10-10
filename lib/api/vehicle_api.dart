import 'dart:convert';

import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';

import '../constant.dart';
import 'auth_api.dart';
import 'base_api.dart';
import 'package:http/http.dart' as http;

class VehicleApi {
  static Future<List<Vehicle>> getVehicles({
    int vehicelPage = 0,
    int vehicelPageSize = 10,
  }) async {
    Uri url = BaseApi.getApiUrl("/vehicle/$vehicelPage/$vehicelPageSize");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );

      if (response.statusCode == 200) {
        List<Vehicle> vehicles = [];

        Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

        for (Map m in decodedJson["data"]) {
          vehicles.add(Vehicle.fromJson(m));
        }

        return vehicles;
      } else {
        throw Exception(
            "getfirstThreeSupscription status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
