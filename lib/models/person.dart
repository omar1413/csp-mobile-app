class Person {
  String? email;
  String? password;
  bool isFirstTime = true;
  Person(this.email, this.password, this.isFirstTime);

  Person.fromJson(Map json)
      : password = json["password"],
        email = json["email"],
        isFirstTime = json["isFirstTime"];

  Map toJson() => {
        "email": email,
        "password": password,
        "isFirstTime": isFirstTime,
      };
}
