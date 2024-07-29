// To parse this JSON data, do
//
//     final authModal = authModalFromJson(jsonString);

import 'dart:convert';

AuthModal authModalFromJson(String str) => AuthModal.fromJson(json.decode(str));

String authModalToJson(AuthModal data) => json.encode(data.toJson());

class AuthModal {
  int? usrId;
  String username;
  String password;

  AuthModal({this.usrId, required this.username, required this.password});

  factory AuthModal.fromJson(Map<String, dynamic> json) {
    return AuthModal(
      usrId: json['usrId'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usrId': usrId,
      'username': username,
      'password': password,
    };
  }
}

