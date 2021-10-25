class Company {
  int? id;
  String? mobileNumber;
  String? name;
  String? commercialRegister;

  Company({this.mobileNumber, this.name, this.id, this.commercialRegister});

  Company.fromJson(Map? json)
      : id = json?["id"] ?? 0,
        name = json?["name"] ?? "",
        mobileNumber = json?["mobileNumber"] ?? "",
        commercialRegister = json?["commercialRegister"] ?? "";

  Map toJson() => {
        "id": id,
        "name": name,
        "mobileNumber": mobileNumber,
        "commercialRegister": commercialRegister,
      };
}
