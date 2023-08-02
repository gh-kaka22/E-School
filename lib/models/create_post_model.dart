// To parse this JSON data, do
//
//     final createPostModel = createPostModelFromJson(jsonString);

import 'dart:convert';

CreatePostModel createPostModelFromJson(String str) => CreatePostModel.fromJson(json.decode(str));

String createPostModelToJson(CreatePostModel data) => json.encode(data.toJson());

class CreatePostModel {
  bool status;
  String message;
  Data data;

  CreatePostModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreatePostModel.fromJson(Map<String, dynamic> json) => CreatePostModel(
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
  String body;
  String date;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int postId;

  Data({
    required this.body,
    required this.date,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.postId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    body: json["body"],
    date: json["date"],
    userId: json["user_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    postId: json["post_id"],
  );

  Map<String, dynamic> toJson() => {
    "body": body,
    "date": date,
    "user_id": userId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "post_id": postId,
  };
}
