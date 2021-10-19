import 'package:csp_mobile_app/models/User.dart';

class Account {
  int? id;
  int? accountNumber;

  Account({this.id});

  Account.fromJson(Map json)
      : id = json["id"],
        accountNumber = json["accountNumber"];

  Map toJson() {
    return {
      "id": id,
      "accountNumber": accountNumber,
    };
  }
}
