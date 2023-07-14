// To parse this JSON data, do
//
//     final showStudentsModel = showStudentsModelFromJson(jsonString);

import 'dart:convert';

ShowStudentsModel showStudentsModelFromJson(String str) => ShowStudentsModel.fromJson(json.decode(str));

String showStudentsModelToJson(ShowStudentsModel data) => json.encode(data.toJson());

class ShowStudentsModel {
  bool status;
  String message;
  List<Datum> data;

  ShowStudentsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowStudentsModel.fromJson(Map<String, dynamic> json) => ShowStudentsModel(
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
  DateTime createdAt;
  DateTime updatedAt;
  String email;
  String roomNumber;

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
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.roomNumber,
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    email: json["email"],
    roomNumber: json["room_number"],
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "email": email,
    "room_number": roomNumber,

  };
}
