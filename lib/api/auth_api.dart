import 'dart:convert';

import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/models/User.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';

class AuthApi {
  static String _token = "";
  static String userName = "";
  static bool isFirstTime = true;

  static Future<Response> login(User user) async {
    Uri url = BaseApi.getApiUrl("/auth/login");

    Map body = user.toJson();
    body.addAll({
      "isPortalOrMobile": true,
    });
    print("request body : " + body.toString());

    return http.post(
      url,
      body: jsonEncode(body),
      headers: kHostHeader,
    );
  }

  static bool saveToken(String bodyJson) {
    Map data = jsonDecode(bodyJson);
    _token = data["data"]["token"];
    userName = data["data"]["username"];
    isFirstTime = data["data"]["isFirstTime"];
    return isFirstTime;
  }

  static String getToken() {
    return "Portal " + _token;
  }
}
