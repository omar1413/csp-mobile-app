class Bundle {
  int id;
  String name;

  Bundle({
    this.id = 0,
    required this.name,
  });

  Bundle.fromJson(Map jsonMap)
      : this.id = jsonMap["id"],
        this.name = jsonMap["bundleName"];
}
