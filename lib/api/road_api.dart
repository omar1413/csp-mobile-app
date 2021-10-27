import 'dart:io';

import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/news_data.dart';
import 'package:csp_mobile_app/models/road_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';
import 'auth_api.dart';
import 'base_api.dart';

Future<List<Road>> getAllRoads() async {
  Uri url = BaseApi.getApiUrl("/road");
  kHostHeader.addAll({"Authorization": AuthApi.getToken()});
  try {
    final roadData = await http.get(
      url,
      headers: kHostHeader,
    );
    print(roadData.statusCode);
    var jsonData = json.decode(utf8.decode(roadData.bodyBytes));
    if (roadData.statusCode == 200) {
      List<Road> allroads = [];
      int cont = 0;
      for (var road in jsonData["data"]) {
        if (cont == 2) {
          break;
        }
        allroads.add(Road.fromJson(road));
        cont--;
      }
      print(allroads);
      return allroads;
    }
    //throw Exception(roadData.statusCode);
    throw GeneralException(jsonData["message"]);
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<List<String>> getAllRoadsName() async {
  Uri url = BaseApi.getApiUrl("/road");
  kHostHeader.addAll({"Authorization": AuthApi.getToken()});
  final roadData = await http.get(
    url,
    headers: kHostHeader,
  );

  var jsonData = json.decode(roadData.body);
  List<String> allroadsname = [];
  for (var name in jsonData["data"]["name"]) {
    allroadsname.add(name.fromJson(New));
  }

  print(allroadsname);
  return allroadsname;
}
