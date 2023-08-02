// To parse this JSON data, do
//
//     final showFileModel = showFileModelFromJson(jsonString);

import 'dart:convert';

ShowFileModel showFileModelFromJson(String str) => ShowFileModel.fromJson(json.decode(str));

String showFileModelToJson(ShowFileModel data) => json.encode(data.toJson());

class ShowFileModel {
  bool status;
  String message;
  List<Datum> data;

  ShowFileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowFileModel.fromJson(Map<String, dynamic> json) => ShowFileModel(
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
  String name;
  String path;
  int classroomId;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.path,
    required this.classroomId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    path: json["path"],
    classroomId: json["classroom_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "path": path,
    "classroom_id": classroomId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
