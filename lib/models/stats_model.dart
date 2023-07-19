// To parse this JSON data, do
//
//     final statsModel = statsModelFromJson(jsonString);

import 'dart:convert';

StatsModel statsModelFromJson(String str) => StatsModel.fromJson(json.decode(str));

String statsModelToJson(StatsModel data) => json.encode(data.toJson());

class StatsModel {
  bool status;
  String message;
  Data data;

  StatsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
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
  int admins;
  int teachers;
  int students;
  int employees;

  Data({
    required this.admins,
    required this.teachers,
    required this.students,
    required this.employees,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    admins: json["admins"],
    teachers: json["teachers"],
    students: json["students"],
    employees: json["employees"],
  );

  Map<String, dynamic> toJson() => {
    "admins": admins,
    "teachers": teachers,
    "students": students,
    "employees": employees,
  };
}
