import 'package:csp_mobile_app/models/road_data.dart';

class Sector {
  int id = 0;
  String name = "";
  Road? road;

  Sector({required this.id, required this.name, required this.road});

  Sector.fromJson(Map json)
      : id = json["id"],
        name = json["name"],
        road = Road.fromJson(json["road"]);
}
