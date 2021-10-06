import 'dart:convert';

import 'package:csp_mobile_app/api/auth-api.dart';
import 'package:csp_mobile_app/models/User.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';
import 'base_api.dart';

class DashboardApi {
  static Future<Response> getSubscriptionCount() {
    Uri url = BaseApi.getApiUrl("/dashboard/subscriptionCount");

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

    return http.get(
      url,
      headers: kHostHeader,
    );
  }
}
