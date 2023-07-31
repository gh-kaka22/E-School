// To parse this JSON data, do
//
//     final addBookModel = addBookModelFromJson(jsonString);

import 'dart:convert';

AddBookModel addBookModelFromJson(String str) => AddBookModel.fromJson(json.decode(str));

String addBookModelToJson(AddBookModel data) => json.encode(data.toJson());

class AddBookModel {
  bool status;
  String message;
  Data data;

  AddBookModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddBookModel.fromJson(Map<String, dynamic> json) => AddBookModel(
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
  String name;
  String url;
  String gradeId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.name,
    required this.url,
    required this.gradeId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    url: json["url"],
    gradeId: json["grade_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "grade_id": gradeId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
