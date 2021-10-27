import 'dart:convert';

import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/User.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';

class AuthApi {
  static User? authedUser;

  static Future<User> login(User user) async {
    try {
      Uri url = BaseApi.getApiUrl("/auth/login");

      Map body = user.toJson();
      body.addAll({
        "isPortalOrMobile": true,
      });
      print("request body : " + body.toString());

      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: kHostHeader,
      );

      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        User u = User.fromJson(responseData["data"]);
        saveToken(u);
        return u;
      } else {
        throw GeneralException(responseData["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  static saveToken(User user) {
    authedUser = user;
  }

  static String getToken() {
    print(authedUser?.toJson());
    String token = authedUser?.token ?? "";
    return "Portal " + token;
  }
}
