class WeatherData {
  Main? main;

  List<Weather> weather = [];

  String? name;

  WeatherData.fromJson(Map json)
      : name = json["name"],
        main = Main.fromJson(json["main"]) {
    List list = json["weather"];
    print("weathers : " + list.toString());
    for (int i = 0; i < list.length; i++) {
      weather.add(Weather.fromJson(list[i]));
    }
  }
}

class Weather {
  String? main;
  String? description;

  Weather.fromJson(Map json)
      : main = json["map"],
        description = json["description"];
}

class Main {
  double? temp;

  Main.fromJson(Map json) : temp = json["temp"];
}
