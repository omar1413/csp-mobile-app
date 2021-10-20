class TransactionType {
  int? id;
  String? code;
  String? desc;

  TransactionType({this.id, this.desc});

  TransactionType.fromJson(Map? json)
      : id = json?["id"],
        code = json?["code"] ?? "",
        desc = json?["desc"] ?? "";

  Map toJson() {
    return {
      "id": id,
      "code": code,
      "desc": desc,
    };
  }
}
