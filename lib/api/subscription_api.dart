import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/Bundle.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:csp_mobile_app/models/vehicle.dart';

class SubscriptionApi {
  static Future<Subscription> save({required Subscription subscription}) async {
    Uri url = BaseApi.getApiUrl("/subscription/save");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});

    try {
      print(jsonEncode(subscription.toJson()));
      final response = await http.post(
        url,
        body: jsonEncode(subscription.toJson()),
        headers: kHostHeader,
      );
      print(response.statusCode);
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return Subscription.fromJson(decodedJson["data"]);
      } else {
        String msg = decodedJson["message"];
        throw GeneralException(decodedJson["message"]);
        //throw Exception(" status code ${response.statusCode} >> ${msg}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<Subscription> update(
      {required Subscription subscription}) async {
    Uri url = BaseApi.getApiUrl("/subscription/renew");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});

    try {
      print(jsonEncode(subscription.toJson()));
      final response = await http.put(
        url,
        body: jsonEncode(subscription.toJson()),
        headers: kHostHeader,
      );
      print(response.statusCode);
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        return Subscription.fromJson(decodedJson["data"]);
      } else {
        String msg = decodedJson["message"];
        throw GeneralException(decodedJson["message"]);
        //throw Exception(" status code ${response.statusCode} >> ${msg}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

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
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        List<Subscription> subscription = [];

        for (Map m in decodedJson["data"]["result"]) {
          subscription.add(Subscription.fromJson(m));
        }

        return subscription;
      } else {
        throw GeneralException(decodedJson["message"]);
        // throw Exception(" status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<Subscription>> getAllSubscriptions({
    int pageNo = 0,
    int pageSize = 10,
  }) async {
    Uri url = BaseApi.getApiUrl("/subscription/user/${pageNo}/${pageSize}");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );
      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        List<Subscription> subscription = [];

        for (Map m in decodedJson["data"]["result"]) {
          subscription.add(Subscription.fromJson(m));
          print(m);
        }

        return subscription;
      } else {
        throw GeneralException(decodedJson["message"]);
        // throw Exception(" status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
