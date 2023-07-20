// To parse this JSON data, do
//
//     final rankingModel = rankingModelFromJson(jsonString);

import 'dart:convert';

RankingModel rankingModelFromJson(String str) => RankingModel.fromJson(json.decode(str));

String rankingModelToJson(RankingModel data) => json.encode(data.toJson());

class RankingModel {
  bool status;
  String message;
  List<Datum> data;

  RankingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) => RankingModel(
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
  String lastName;
  int id;
  double result;
  int gradeId;
  String schoolyear;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.result,
    required this.gradeId,
    required this.schoolyear,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    studentId: json["student_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    id: json["id"],
    result: json["result"]?.toDouble(),
    gradeId: json["grade_id"],
    schoolyear: json["schoolyear"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "first_name": firstName,
    "last_name": lastName,
    "id": id,
    "result": result,
    "grade_id": gradeId,
    "schoolyear": schoolyear,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
