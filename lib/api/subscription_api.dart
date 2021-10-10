import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/Bundle.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:csp_mobile_app/models/vehicle.dart';

class SubscriptionApi {
  static Future<List<Subscription>> getVehicleSubscriptions({
    required int vehicleId,
    int pageNo = 0,
    int pageSize = 10,
  }) async {
    Uri url = BaseApi.getApiUrl(
        "/subscription/vehicle/${vehicleId}/${pageNo}/${pageSize}");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );

      if (response.statusCode == 200) {
        List<Subscription> subscription = [];

        Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

        for (Map m in decodedJson["data"]) {
          subscription.add(Subscription.fromJson(m));
        }

        return subscription;
      } else {
        throw Exception(" status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<Subscription>> findAll({int? id}) {
    Vehicle vechile = Vehicle(
      id: 0,
      plateLetters: "ss",
      plateNumbers: "555",
      tagValue: "ss",
      type: VehicleType(
        code: "s",
        desc: "s",
        id: 5,
      ),
    );
    Subscription sub = Subscription(
      bundle: Bundle(name: "test"),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      vechile: vechile,
    );
    if (id != null) {
      return Future.delayed(Duration(seconds: 1), () {
        return [
          sub,
          sub,
          sub,
        ];
      });
    }
    return Future.value([
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
    ]);
  }
}
