// To parse this JSON data, do
//
//     final classroomModel = classroomModelFromJson(jsonString);

import 'dart:convert';

ClassroomModel classroomModelFromJson(String str) =>
    ClassroomModel.fromJson(json.decode(str));

String classroomModelToJson(ClassroomModel data) =>
    json.encode(data.toJson());

class ClassroomModel {
  bool? status;
  String? message;
  List<Datum>? data;

  ClassroomModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ClassroomModel.fromJson(Map<String, dynamic> json) =>
      ClassroomModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int classroomId;
  int capacity;
  String roomNumber;
  int gradeId;

  Datum({
    required this.classroomId,
    required this.capacity,
    required this.roomNumber,
    required this.gradeId
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    classroomId: json["classroom_id"],
    capacity: json["capacity"],
    roomNumber: json["room_number"],
    gradeId: json["grade_id"],

  );

  Map<String, dynamic> toJson() => {
    "classroom_id": classroomId,
    "capacity": capacity,
    "room_number": roomNumber,
    "grade_id": gradeId,
  };
}
