// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) =>
    SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) =>
    json.encode(data.toJson());

class SubjectModel {
  bool? status;
  String? message;
  List<Datum>? data;

  SubjectModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      SubjectModel(
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
  int subjectId;
  String name;
  int max_mark;

  Datum({
    required this.subjectId,
    required this.name,
    required this.max_mark,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subjectId: json["subject_id"],
    name: json["name"],
    max_mark: json["max_mark"],

  );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "name": name,
    "max_mark": max_mark,
  };
}
