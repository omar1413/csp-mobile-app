class GovernorateLkp {
  String? code;
  String? desc;
  int? id;

  GovernorateLkp({this.code, this.desc, this.id});

  GovernorateLkp.fromJson(Map? JsonMap)
      : this.id = JsonMap?["id"],
        this.code = JsonMap?["code"],
        this.desc = JsonMap?["code"];
  Map toJson() {
    return {
      "id": id,
      "desc": desc,
      "code": code,
    };
  }
}
