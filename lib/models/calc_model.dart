// To parse this JSON data, do
//
//     final calcModel = calcModelFromJson(jsonString);

import 'dart:convert';

CalcModel calcModelFromJson(String str) => CalcModel.fromJson(json.decode(str));

String calcModelToJson(CalcModel data) => json.encode(data.toJson());

class CalcModel {
  bool status;
  String message;
  List<Datum> data;

  CalcModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CalcModel.fromJson(Map<String, dynamic> json) => CalcModel(
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
  String schoolyear;
  String lastName;
  double average;

  Datum({
    required this.studentId,
    required this.firstName,
    required this.schoolyear,
    required this.lastName,
    required this.average,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    studentId: json["student_id"],
    firstName: json["first_name"],
    schoolyear: json["schoolyear"],
    lastName: json["last_name"],
    average: json["average"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "first_name": firstName,
    "schoolyear": schoolyear,
    "last_name": lastName,
    "average": average,
  };
}
