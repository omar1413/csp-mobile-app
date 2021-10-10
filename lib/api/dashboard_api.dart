import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/models/User.dart';
import 'package:csp_mobile_app/models/subscription.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';
import 'base_api.dart';

class DashboardApi {
  static Future<Response> getSubscriptionCount() {
    Uri url = BaseApi.getApiUrl("/dashboard/subscriptionCount");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    return http.get(
      url,
      headers: kHostHeader,
    );
  }

  static Future<Response> getVehicleCount() {
    Uri url = BaseApi.getApiUrl("/dashboard/vehicleCount");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    return http.get(
      url,
      headers: kHostHeader,
    );
  }

  static Future<Response> getWalletAmount() {
    Uri url = BaseApi.getApiUrl("/dashboard/walletAmount");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    return http.get(
      url,
      headers: kHostHeader,
    );
  }

  static Future<List<Subscription>> getfirstThreeSupscription() async {
    Uri url = BaseApi.getApiUrl("/dashboard/firsThreetSubscriptionsToEnd");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );

      if (response.statusCode == 200) {
        List<Subscription> subs = [];

        Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

        for (Map m in decodedJson["data"]) {
          subs.add(Subscription.fromJson(m));
        }

        return subs;
      } else {
        throw Exception(
            "getfirstThreeSupscription status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
