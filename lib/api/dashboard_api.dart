import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/User.dart';
import 'package:csp_mobile_app/models/subscription.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';
import 'base_api.dart';

class DashboardApi {
  static Future<int> getSubscriptionCount() async {
    Uri url = BaseApi.getApiUrl("/dashboard/subscriptionCount");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["data"];
      }
      String msg = body["message"];
      throw GeneralException(body["message"]);
      // throw Exception("status code ${response.statusCode} with msg ${msg}");
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> getVehicleCount() async {
    Uri url = BaseApi.getApiUrl("/dashboard/vehicleCount");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["data"];
      }
      String msg = body["message"];
      throw GeneralException(body["message"]);
      //throw Exception("status code ${response.statusCode} with msg ${msg}");
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> getWalletAmount() async {
    Uri url = BaseApi.getApiUrl("/dashboard/walletAmount");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["data"];
      }
      String msg = body["message"];
      throw GeneralException(body["message"]);
      //throw Exception("status code ${response.statusCode} with msg ${msg}");
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Subscription>> getfirstThreeSupscription(
      {int pageNo = 0, int pageSize = 3}) async {
    Uri url = BaseApi.getApiUrl(
        "/dashboard/firsThreetSubscriptionsToEnd/${pageNo}/${pageSize}");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        List<Subscription> subs = [];

        for (Map m in decodedJson["data"]) {
          subs.add(Subscription.fromJson(m));
        }

        return subs;
      } else {
        throw GeneralException(decodedJson["message"]);
        // throw Exception(
        //     "getfirstThreeSupscription status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
