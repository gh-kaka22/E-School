// To parse this JSON data, do
//
//     final showCommentsModel = showCommentsModelFromJson(jsonString);

import 'dart:convert';

ShowCommentsModel showCommentsModelFromJson(String str) => ShowCommentsModel.fromJson(json.decode(str));

String showCommentsModelToJson(ShowCommentsModel data) => json.encode(data.toJson());

class ShowCommentsModel {
  bool status;
  String message;
  List<Datum> data;

  ShowCommentsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowCommentsModel.fromJson(Map<String, dynamic> json) => ShowCommentsModel(
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
  int postId;
  int userId;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  String date;
  int role;
  bool isMine;
  String publisher;

  Datum({
    required this.id,
    required this.postId,
    required this.userId,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.date,
    required this.role,
    required this.isMine,
    required this.publisher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    postId: json["post_id"],
    userId: json["user_id"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    date: json["date"],
    role: json["role"],
    isMine: json["is_mine"],
    publisher: json["publisher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "user_id": userId,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "date": date,
    "role": role,
    "is_mine": isMine,
    "publisher": publisher,
  };
}
