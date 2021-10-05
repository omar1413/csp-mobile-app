class User {
  String username;
  String password;

  User(this.username, this.password);

  Map toJson() => {
        "username": username,
        "password": password,
      };
}
