// To parse this JSON data, do
//
//     final examsModel = examsModelFromJson(jsonString);

import 'dart:convert';

ExamsModel examsModelFromJson(String str) => ExamsModel.fromJson(json.decode(str));

String examsModelToJson(ExamsModel data) => json.encode(data.toJson());

class ExamsModel {
  bool status;
  String message;
  List<Datum> data;

  ExamsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ExamsModel.fromJson(Map<String, dynamic> json) => ExamsModel(
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
  String name;
  int maxMark;
  int id;
  int studentId;
  int subjectId;
  int typeId;
  int mark;
  DateTime date;
  String schoolyear;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.name,
    required this.maxMark,
    required this.id,
    required this.studentId,
    required this.subjectId,
    required this.typeId,
    required this.mark,
    required this.date,
    required this.schoolyear,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    maxMark: json["max_mark"],
    id: json["id"],
    studentId: json["student_id"],
    subjectId: json["subject_id"],
    typeId: json["type_id"],
    mark: json["mark"],
    date: DateTime.parse(json["date"]),
    schoolyear: json["schoolyear"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "max_mark": maxMark,
    "id": id,
    "student_id": studentId,
    "subject_id": subjectId,
    "type_id": typeId,
    "mark": mark,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "schoolyear": schoolyear,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
