// To parse this JSON data, do
//
//     final showExamsModel = showExamsModelFromJson(jsonString);

import 'dart:convert';

ShowExamsModel showExamsModelFromJson(String str) => ShowExamsModel.fromJson(json.decode(str));

String showExamsModelToJson(ShowExamsModel data) => json.encode(data.toJson());

class ShowExamsModel {
  bool status;
  String message;
  List<Datum> data;

  ShowExamsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowExamsModel.fromJson(Map<String, dynamic> json) => ShowExamsModel(
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
  int id;
  int studentId;
  int subjectId;
  int typeId;
  int mark;
  DateTime date;
  String schoolyear;
  String firstName;
  String lastName;
  String name;
  int maxMark;

  Datum({
    required this.id,
    required this.studentId,
    required this.subjectId,
    required this.typeId,
    required this.mark,
    required this.date,
    required this.schoolyear,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.maxMark,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    studentId: json["student_id"],
    subjectId: json["subject_id"],
    typeId: json["type_id"],
    mark: json["mark"],
    date: DateTime.parse(json["date"]),
    schoolyear: json["schoolyear"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    name: json["name"],
    maxMark: json["max_mark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_id": studentId,
    "subject_id": subjectId,
    "type_id": typeId,
    "mark": mark,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "schoolyear": schoolyear,
    "first_name": firstName,
    "last_name": lastName,
    "name": name,
    "max_mark": maxMark,
  };
}
