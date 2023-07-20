// To parse this JSON data, do
//
//     final upgradeModel = upgradeModelFromJson(jsonString);

import 'dart:convert';

UpgradeModel upgradeModelFromJson(String str) => UpgradeModel.fromJson(json.decode(str));

String upgradeModelToJson(UpgradeModel data) => json.encode(data.toJson());

class UpgradeModel {
  bool status;
  String message;
  List<Datum> data;

  UpgradeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpgradeModel.fromJson(Map<String, dynamic> json) => UpgradeModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int studentId;
  String firstName;
  String lastName;
  String religion;
  DateTime dateOfBirth;
  String address;
  String details;
  int gradeId;
  int genderId;
  int parentId;
  int userId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.religion,
    required this.dateOfBirth,
    required this.address,
    required this.details,
    required this.gradeId,
    required this.genderId,
    required this.parentId,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    studentId: json["student_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    religion: json["religion"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    address: json["address"],
    details: json["details"],
    gradeId: json["grade_id"],
    genderId: json["gender_id"],
    parentId: json["parent_id"],
    userId: json["user_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "first_name": firstName,
    "last_name": lastName,
    "religion": religion,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "address": address,
    "details": details,
    "grade_id": gradeId,
    "gender_id": genderId,
    "parent_id": parentId,
    "user_id": userId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
