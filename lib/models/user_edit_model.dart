class UserEditModel {
  final String? userName;
  final String? name;
  final String? email;
  final String? password;

  UserEditModel({
    this.userName,
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
