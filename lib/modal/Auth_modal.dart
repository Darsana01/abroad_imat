// To parse this JSON data, do
//
//     final authModal = authModalFromJson(jsonString);

import 'dart:convert';

AuthModal authModalFromJson(String str) => AuthModal.fromJson(json.decode(str));

String authModalToJson(AuthModal data) => json.encode(data.toJson());

class AuthModal {
    
    String username;
    String password;

    AuthModal({
        required this.username,
        required this.password,
    });

    factory AuthModal.fromJson(Map<String, dynamic> json) => AuthModal(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
