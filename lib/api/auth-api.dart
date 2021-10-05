import 'dart:convert';

import 'package:csp_mobile_app/models/User.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';

class AuthApi {
  static Future<Response> login(User user) async {
    Uri url = Uri.http(kHost, "${kPrefixHost}/auth/login");

    print("url : " + url.toString());
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
}
