// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool status;
  String message;
  Data data;

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
    "data": data.toJson(),
  };
}

class Data {
  int? id;
  String firstName;
  String lastName;
  int userId;
  dynamic createdAt;
  dynamic updatedAt;
  String token;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userId: json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "token": token,
  };
}
