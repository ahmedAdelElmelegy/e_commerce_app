class SignInModel {
  final String username;
  final String email;
  final String phone;
  final String password;

  SignInModel(
      {required this.username,
      required this.email,
      required this.phone,
      required this.password});
  Map<String, dynamic> toMap() {
    return {
      'name': username,
      'email': email,
      'phone': phone,
      'password': password
    };
  }
}
