// ignore_for_file: file_names

import 'dart:convert';

import 'package:csp_mobile_app/models/account.dart';
import 'package:csp_mobile_app/models/registration.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';
import 'auth_api.dart';
import 'base_api.dart';

class RegistrationApi {
  static Future<Response> saveUser(Registration registration) async {
    Uri url = BaseApi.getApiUrl("/user/save");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});

    try {
      print(jsonEncode(registration.toJson()));
      final response = await http.post(
        url,
        body: jsonEncode(registration.toJson()),
        headers: kHostHeader,
      );

      print(response.statusCode);

      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      print(decodedJson);
      if (response.statusCode == 200) {
        return response;
      } else {
        String msg = decodedJson["message"];
        throw Exception(" status code ${response.statusCode} >> ${msg}");
      }
    } on TypeError catch (e) {
      print(e.stackTrace);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<Response> saveContinueRegistration(Account account) async {
    Uri url = BaseApi.getApiUrl("/account/save");
    kHostHeader.addAll({"Authorization": AuthApi.getToken()});

    try {
      print(jsonEncode(account.toJson()));
      final response = await http.post(
        url,
        body: jsonEncode(account.toJson()),
        headers: kHostHeader,
      );

      print(response.statusCode);

      Map decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      print(decodedJson);
      if (response.statusCode == 200) {
        return response;
      } else {
        String msg = decodedJson["message"];
        throw Exception(" status code ${response.statusCode} >> ${msg}");
      }
    } on TypeError catch (e) {
      print(e.stackTrace);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
