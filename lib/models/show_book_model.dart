// To parse this JSON data, do
//
//     final showBookModel = showBookModelFromJson(jsonString);

import 'dart:convert';

ShowBookModel showBookModelFromJson(String str) => ShowBookModel.fromJson(json.decode(str));

String showBookModelToJson(ShowBookModel data) => json.encode(data.toJson());

class ShowBookModel {
  bool status;
  String message;
  List<Datum> data;

  ShowBookModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowBookModel.fromJson(Map<String, dynamic> json) => ShowBookModel(
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
  String url;
  String name;
  int gradeId;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.url,
    required this.name,
    required this.gradeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    gradeId: json["grade_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "grade_id": gradeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
