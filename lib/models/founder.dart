class Founder {
  int? id;
  String? code;
  String? desc;

  Founder({this.id, this.desc, this.code});

  Founder.fromJson(Map? json)
      : id = json?["id"],
        code = json?["code"] ?? "",
        desc = json?["desc"] ?? "";

  Map toJson() => {
        "id": id,
        "code": code,
        "desc": desc,
      };
}
