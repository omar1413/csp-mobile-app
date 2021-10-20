import 'dart:convert';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/models/Bundle.dart';
import 'package:csp_mobile_app/models/sector.dart';

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
        throw Exception("bundleLkp status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<Sector>> bundSectors(Bundle bundle) async {
    Uri url = BaseApi.getApiUrl("/bundle/sector/${bundle.id}");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});
    try {
      final response = await http.get(
        url,
        headers: kHostHeader,
      );

      if (response.statusCode == 200) {
        List<Sector> sectors = [];

        Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

        for (Map m in decodedJson["data"]) {
          sectors.add(Sector.fromJson(m));
        }

        return sectors;
      } else {
        throw Exception("bundSectors status code ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
