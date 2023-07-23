// To parse this JSON data, do
//
//     final changeLikeModel = changeLikeModelFromJson(jsonString);

import 'dart:convert';

ChangeLikeModel changeLikeModelFromJson(String str) => ChangeLikeModel.fromJson(json.decode(str));

String changeLikeModelToJson(ChangeLikeModel data) => json.encode(data.toJson());

class ChangeLikeModel {
  bool status;
  String message;
  int data;

  ChangeLikeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChangeLikeModel.fromJson(Map<String, dynamic> json) => ChangeLikeModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
