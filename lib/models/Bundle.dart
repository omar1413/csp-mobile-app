class Bundle {
  int id;
  String name;
  double? price;

  Bundle({
    this.id = 0,
    required this.name,
  });

  Bundle.fromJson(Map jsonMap)
      : this.id = jsonMap["id"],
        this.name = jsonMap["bundleName"],
        this.price = jsonMap["price"];

  Map toJson() {
    return {
      "id": id,
      "bundleName": name,
    };
  }
}
