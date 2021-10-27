import 'dart:io';

import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/news_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';

Future<List<New>> getAllNews() async {
  Uri url = BaseApi.getApiUrl("/news");

  kHostHeader.addAll({"Authorization": AuthApi.getToken()});
  try {
    final newsData = await http.get(
      url,
      headers: kHostHeader,
    );
    print(newsData.statusCode);
    Map jsonData = jsonDecode(utf8.decode(newsData.bodyBytes));
    if (newsData.statusCode == 200) {
      print(jsonData["data"]);
      List<New> allNews = [];
      for (var _new in jsonData["data"]) {
        allNews.add(New.fromJson(_new));
      }
      print(allNews);
      return allNews;
    }

    throw GeneralException(jsonData["message"]);
  } catch (e) {
    print(e);
    rethrow;
  }
  throw Exception();
}
