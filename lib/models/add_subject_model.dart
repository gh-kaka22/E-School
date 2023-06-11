// To parse this JSON data, do
//
//     final addSubjectModel = addSubjectModelFromJson(jsonString);

import 'dart:convert';

AddSubjectModel addSubjectModelFromJson(String str) => AddSubjectModel.fromJson(json.decode(str));

String addSubjectModelToJson(AddSubjectModel data) => json.encode(data.toJson());

class AddSubjectModel {
  bool? status;
  String? message;
  Data? data;

  AddSubjectModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddSubjectModel.fromJson(Map<String, dynamic> json) => AddSubjectModel(
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
  String name;
  String maxMark;
  int subjectId;

  Data({
    required this.name,
    required this.maxMark,
    required this.subjectId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    maxMark: json["max_mark"],
    subjectId: json["subject_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "max_mark": maxMark,
    "subject_id": subjectId,
  };
}
