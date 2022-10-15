class UserModel {
  String email;
  String password;
  UserModel({
    required this.email,
    required this.password,
  });

  factory UserModel.fromMap(Map json) {
    return UserModel(email: json["email"], password: json["password"]);
  }
}
