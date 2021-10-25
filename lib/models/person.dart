class Person {
  int? id;
  String? mobileNumber;
  String? name;
  String? nationalNumber;
  String? passportNumber;
  int? walletAmount;
  Person(
      {this.mobileNumber,
      this.name,
      this.id,
      this.nationalNumber,
      this.passportNumber,
      this.walletAmount});

  Person.fromJson(Map? json)
      : id = json?["id"] ?? 0,
        name = json?["name"] ?? "",
        mobileNumber = json?["mobileNumber"] ?? "",
        nationalNumber = json?["nationalNumber"] ?? "",
        passportNumber = json?["passportNumber"] ?? "",
        walletAmount = json?["walletAmount"] ?? 0;

  Map toJson() => {
        "id": id,
        "name": name,
        "mobileNumber": mobileNumber,
        "nationalNumber": nationalNumber,
        "passportNumber": passportNumber,
        "walletAmount": walletAmount,
      };
}
