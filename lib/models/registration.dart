import 'package:csp_mobile_app/models/user_customer.dart';

class Registration {
  UserCustomer userCustomer;
  String? username;

  Registration(
    this.userCustomer,
    this.username,
  );
  Registration.fromJson(Map json)
      : userCustomer = UserCustomer.fromJson(json["userCustomer"]),
        username = json["username"];

  Map toJson() => {
        "userName": username,
        "userCustomer": userCustomer.toJson(),
      };
}
