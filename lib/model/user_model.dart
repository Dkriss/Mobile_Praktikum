
class UserModel{
  final String email;
  final String password;

  UserModel ({
    required this.email,
    required this.password,
  });

  toJson() async {
    return {
      "Email": email,
      "Password": password,
    };
  }
}