// To parse this JSON data, do
//
//     final addExamsModel = addExamsModelFromJson(jsonString);

import 'dart:convert';

AddExamsModel addExamsModelFromJson(String str) => AddExamsModel.fromJson(json.decode(str));

String addExamsModelToJson(AddExamsModel data) => json.encode(data.toJson());

class AddExamsModel {
  bool status;
  String message;
  List<Datum> data;

  AddExamsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddExamsModel.fromJson(Map<String, dynamic> json) => AddExamsModel(
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
  String email;
  DateTime dateOfBirth;
  String address;
  String details;
  int gradeId;
  int genderId;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.religion,
    required this.email,
    required this.dateOfBirth,
    required this.address,
    required this.details,
    required this.gradeId,
    required this.genderId,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    studentId: json["student_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    religion: json["religion"],
    email: json["email"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    address: json["address"],
    details: json["details"],
    gradeId: json["grade_id"],
    genderId: json["gender_id"],
    parentId: json["parent_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "first_name": firstName,
    "last_name": lastName,
    "religion": religion,
    "email": email,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "address": address,
    "details": details,
    "grade_id": gradeId,
    "gender_id": genderId,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
