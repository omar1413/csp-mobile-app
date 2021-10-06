import 'dart:io';

import 'package:csp_mobile_app/models/news_dara.dart';
import 'package:csp_mobile_app/models/road_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';

Future<List<Road>> gitAllRoads() async {
  final roadData =
      await http.get(Uri.http(kHost, "${kPrefixHost}/portal/road"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
  });

  var jsonData = json.decode(roadData.body);
  List<Road> allroads = [];
  for (var road in jsonData) {
    allroads.add(road.fromJson(New));
  }

  return allroads;
}
