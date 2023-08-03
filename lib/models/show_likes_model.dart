// To parse this JSON data, do
//
//     final showLikesModel = showLikesModelFromJson(jsonString);

import 'dart:convert';

ShowLikesModel showLikesModelFromJson(String str) => ShowLikesModel.fromJson(json.decode(str));

String showLikesModelToJson(ShowLikesModel data) => json.encode(data.toJson());

class ShowLikesModel {
  bool status;
  String message;
  List<Datum> data;

  ShowLikesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowLikesModel.fromJson(Map<String, dynamic> json) => ShowLikesModel(
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
  DateTime createdAt;
  DateTime updatedAt;
  int role;
  String publisher;

  Datum({
    required this.id,
    required this.postId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.publisher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    postId: json["post_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    role: json["role"],
    publisher: json["publisher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "role": role,
    "publisher": publisher,
  };
}
