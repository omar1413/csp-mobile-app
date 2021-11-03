import 'package:csp_mobile_app/models/account.dart';

class User {
  String? username;
  String? password;
  String? token;
  bool? isFirstTime;

  User({
    this.username,
    this.password,
    this.token,
    this.isFirstTime = false,
  });

  Map toJson() => {
        "username": username,
        "password": password,
        "isFirstTime": isFirstTime,
        "token": token,
      };

  User.fromJson(Map? json)
      : username = json?["username"] ?? "",
        password = json?["password"] ?? "",
        isFirstTime = json?["isFirstTime"] ?? false,
        token = json?["token"] ?? "";
}
