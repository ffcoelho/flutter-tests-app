import 'dart:convert';

class AuthModel {
  AuthModel({
    this.username,
    this.password,
  });

  final String username;
  final String password;

  AuthModel copyWith({
    String login,
    String password,
  }) => AuthModel(
    username: username ?? this.username,
    password: password ?? this.password,
  );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };

  bool get isValidEmail => true;
  bool get isValidPassword =>
      password != null && password.isNotEmpty && password.length > 3;
}