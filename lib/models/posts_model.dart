// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  bool status;
  String message;
  List<Datum> data;

  PostsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
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
  int postId;
  String body;
  String date;
  DateTime updatedAt;
  int userId;
  int role;
  int likesCount;
  int comentsCount;
  bool? isLiked;
  bool? isMine;
  String publisher;

  Datum({
    required this.postId,
    required this.body,
    required this.date,
    required this.updatedAt,
    required this.userId,
    required this.role,
    required this.likesCount,
    required this.comentsCount,
    required this.isLiked,
    required this.isMine,
    required this.publisher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    postId: json["post_id"],
    body: json["body"],
    date: json["date"],
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    role: json["role"],
    likesCount: json["likes_count"],
    comentsCount: json["coments_count"],
    isLiked: json["is_liked"],
    isMine: json["is_mine"],
    publisher: json["publisher"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "body": body,
    "date": date,
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
    "role": role,
    "likes_count": likesCount,
    "coments_count": comentsCount,
    "is_liked": isLiked,
    "is_mine": isMine,
    "publisher": publisher,
  };
}
