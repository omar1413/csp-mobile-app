class AccountType {
  int? id;
  String? code;
  String? desc;

  AccountType({this.id, this.desc, this.code});

  AccountType.fromJson(Map? json)
      : id = json?["id"],
        code = json?["code"] ?? "",
        desc = json?["desc"] ?? "";

  Map toJson() => {
        "id": id,
        "code": code,
        "desc": desc,
      };
}
