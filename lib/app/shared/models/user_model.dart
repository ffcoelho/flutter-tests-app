// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    this.username,
    this.name,
    this.email,
    this.photoUrl,
    this.role,
    this.token,
  });

  final String username;
  final String name;
  final String email;
  final String photoUrl;
  final String role;
  final String token;

  UserModel copyWith({
    String username,
    String name,
    String email,
    String photoUrl,
    String role,
    String token,
  }) => UserModel(
    username: username ?? this.username,
    name: name ?? this.name,
    email: email ?? this.email,
    photoUrl: photoUrl ?? this.photoUrl,
    role: role ?? this.role,
    token: token ?? this.token,
  );

  factory UserModel.fromRawJson(String str) =>
    UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json['username'],
    name: json['name'],
    email: json['email'],
    photoUrl: json['photoUrl'],
    role: json['role'],
    token: json['token'],
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'name': name,
    'email': email,
    'photoUrl': photoUrl,
    'role': role,
    'token': token,
  };
}