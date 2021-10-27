import 'dart:convert';

import 'package:csp_mobile_app/exception/general_exception.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
import 'package:csp_mobile_app/models/weather_data.dart';

import '../constant.dart';

import 'package:http/http.dart' as http;

import 'package:location/location.dart';

class WetherApi {
  static String API_KEY = "4c643cae989cd2e773ac0065f1459bbb";
  static Future<WeatherData> getWetherData() async {
    try {
      final position = await _GeoLocation._determinePosition();

      Uri url = Uri.https(
        "api.openweathermap.org",
        "/data/2.5/weather",
        {
          "lat": position.latitude?.toString(),
          "lon": position.longitude?.toString(),
          "lang": "ar",
          "appid": API_KEY,
          "units": "metric",
        },
      );

      print(url);
      final response = await http.get(url, headers: kHostHeader);
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      print(body);
      if (response.statusCode == 200) {
        return WeatherData.fromJson(body);
      }
      throw GeneralException(body["message"]);
      // throw Exception("status code ${response.statusCode}");
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

class _GeoLocation {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<LocationData> _determinePosition() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error("service not enabled");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error("permisiin not enabled");
      }
    }

    return location.getLocation();
  }
}
