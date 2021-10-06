import 'dart:io';

import 'package:csp_mobile_app/models/news_dara.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';

Future<List<New>> gitAllNews() async {
  final newsData =
      await http.get(Uri.http(kHost, "${kPrefixHost}/news"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
  });
  if (newsData.statusCode == 200) {
    var jsonData = json.decode(newsData.body);

    List<New> allNews = [];
    for (var _new in jsonData) {
      allNews.add(_new.fromJson(New));
    }
    return allNews;
  } else {
    throw Exception();
  }
}
