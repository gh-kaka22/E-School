// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool status;
  String message;
  Data? data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  String email;
  int role;
  String token;

  Data({
    required this.email,
    required this.role,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    role: json["role"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "role": role,
    "token": token,
  };
}
