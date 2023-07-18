// To parse this JSON data, do
//
//     final createCommentModel = createCommentModelFromJson(jsonString);

import 'dart:convert';

CreateCommentModel createCommentModelFromJson(String str) => CreateCommentModel.fromJson(json.decode(str));

String createCommentModelToJson(CreateCommentModel data) => json.encode(data.toJson());

class CreateCommentModel {
  bool status;
  String message;
  Data data;

  CreateCommentModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateCommentModel.fromJson(Map<String, dynamic> json) => CreateCommentModel(
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
  int postId;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.body,
    required this.postId,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    body: json["body"],
    postId: json["post_id"],
    userId: json["user_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "body": body,
    "post_id": postId,
    "user_id": userId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
