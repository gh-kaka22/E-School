// To parse this JSON data, do
//
//     final teacherHomeModel = teacherHomeModelFromJson(jsonString);

import 'dart:convert';

TeacherHomeModel teacherHomeModelFromJson(String str) => TeacherHomeModel.fromJson(json.decode(str));

String teacherHomeModelToJson(TeacherHomeModel data) => json.encode(data.toJson());

class TeacherHomeModel {
  bool status;
  String message;
  Data data;

  TeacherHomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TeacherHomeModel.fromJson(Map<String, dynamic> json) => TeacherHomeModel(
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
  String firstName;
  String lastName;
  String subjectName;
  List<Class> classes;

  Data({
    required this.firstName,
    required this.lastName,
    required this.subjectName,
    required this.classes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["first_name"],
    lastName: json["last_name"],
    subjectName: json["subject_name"],
    classes: List<Class>.from(json["classes"].map((x) => Class.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "subject_name": subjectName,
    "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
  };
}

class Class {
  int classroomId;
  int gradeId;
  String roomNumber;

  Class({
    required this.classroomId,
    required this.gradeId,
    required this.roomNumber,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    classroomId: json["classroom_id"],
    gradeId: json["grade_id"],
    roomNumber: json["room_number"],
  );

  Map<String, dynamic> toJson() => {
    "classroom_id": classroomId,
    "grade_id": gradeId,
    "room_number": roomNumber,
  };
}
