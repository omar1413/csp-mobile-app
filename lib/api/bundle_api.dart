import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/models/Bundle.dart';

import 'package:csp_mobile_app/models/subscription.dart';

import 'package:http/http.dart' as http;

import '../constant.dart';
import 'base_api.dart';

class BundleApi {
  static Future<List<Bundle>> bundleLkp() async {
    Uri url = BaseApi.getApiUrl("/bundle");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );

      if (response.statusCode == 200) {
        List<Bundle> bundels = [];

        Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

        for (Map m in decodedJson["data"]) {
          bundels.add(Bundle.fromJson(m));
        }

        return bundels;
      } else {
        throw Exception(
            "getfirstThreeSupscription status code ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
