// To parse this JSON data, do
//
//     final addExamsEnteredModel = addExamsEnteredModelFromJson(jsonString);

import 'dart:convert';

AddExamsEnteredModel addExamsEnteredModelFromJson(String str) => AddExamsEnteredModel.fromJson(json.decode(str));

String addExamsEnteredModelToJson(AddExamsEnteredModel data) => json.encode(data.toJson());

class AddExamsEnteredModel {
  bool? status;
  String? message;
  Data? data;

  AddExamsEnteredModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddExamsEnteredModel.fromJson(Map<String, dynamic> json) => AddExamsEnteredModel(
    status: json["status"],
    message: json["message"],
      data: json['data'] != null ? Data.fromJson(json['data']) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String studentId;
  int subjectId;
  String typeId;
  String mark;
  String date;
  String schoolyear;

  int id;

  Data({
    required this.studentId,
    required this.subjectId,
    required this.typeId,
    required this.mark,
    required this.date,
    required this.schoolyear,

    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    studentId: json["student_id"],
    subjectId: json["subject_id"],
    typeId: json["type_id"],
    mark: json["mark"],
    date: json["date"],
    schoolyear: json["schoolyear"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "subject_id": subjectId,
    "type_id": typeId,
    "mark": mark,
    "date": date,
    "schoolyear": schoolyear,
    "id": id,
  };
}
