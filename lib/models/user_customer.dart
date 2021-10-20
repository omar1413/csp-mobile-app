import 'package:flutter/cupertino.dart';

class UserCustomer {
  String? email;
  String? password;
  bool? isFirstTime;
  UserCustomer(this.email, this.password, this.isFirstTime);

  UserCustomer.fromJson(Map json)
      : password = json["password"],
        email = json["email"],
        isFirstTime = json["isFirstTime"];

  Map toJson() => {
        "email": email,
        "password": password,
        "isFirstTime": isFirstTime,
      };
}
