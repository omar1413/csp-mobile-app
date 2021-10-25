import 'package:csp_mobile_app/models/account_type_lkp.dart';
import 'package:csp_mobile_app/models/company.dart';
import 'package:csp_mobile_app/models/person.dart';

class Account {
  int? id;
  int? accountNumber;
  AccountType? accountType;
  Person? person;
  Company? company;
  bool? isForeigner;

  Account(
      {this.id,
      this.person,
      this.accountNumber,
      this.accountType,
      this.company,
      this.isForeigner});

  Account.fromJson(Map? json)
      : id = json?["id"],
        accountNumber = json?["accountNumber"] ?? 0,
        accountType = AccountType.fromJson(json?["accountTypeLkp"]),
        person = Person.fromJson(json?["person"]),
        company = Company.fromJson(json?["company"]),
        isForeigner = json?["isForeigner"] ?? false;

  Map toJson() {
    return {
      "id": id,
      "accountNumber": accountNumber,
      "accountTypeLkp": accountType?.toJson(),
      "person": person?.toJson(),
      "company": company?.toJson(),
      "isForeigner": isForeigner,
    };
  }
}
