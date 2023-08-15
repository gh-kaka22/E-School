// To parse this JSON data, do
//
//     final examScheduleModel = examScheduleModelFromJson(jsonString);

import 'dart:convert';

ExamScheduleModel examScheduleModelFromJson(String str) => ExamScheduleModel.fromJson(json.decode(str));

String examScheduleModelToJson(ExamScheduleModel data) => json.encode(data.toJson());

class ExamScheduleModel {
  bool status;
  String message;
  Data data;

  ExamScheduleModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ExamScheduleModel.fromJson(Map<String, dynamic> json) => ExamScheduleModel(
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
  int examScheduleId;
  String image;
  int gradeId;
  int schoolYear;
  DateTime createdAt;
  DateTime updatedAt;
  String typeName;

  Data({
    required this.examScheduleId,
    required this.image,
    required this.gradeId,
    required this.schoolYear,
    required this.createdAt,
    required this.updatedAt,
    required this.typeName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    examScheduleId: json["exam_schedule_id"],
    image: json["image"],
    gradeId: json["grade_id"],
    schoolYear: json["School_Year"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    typeName: json["type_name"],
  );

  Map<String, dynamic> toJson() => {
    "exam_schedule_id": examScheduleId,
    "image": image,
    "grade_id": gradeId,
    "School_Year": schoolYear,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type_name": typeName,
  };
}
