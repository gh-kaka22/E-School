// To parse this JSON data, do
//
//     final addFileModel = addFileModelFromJson(jsonString);

import 'dart:convert';

AddFileModel addFileModelFromJson(String str) => AddFileModel.fromJson(json.decode(str));

String addFileModelToJson(AddFileModel data) => json.encode(data.toJson());

class AddFileModel {
  bool status;
  String message;
  Data data;

  AddFileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddFileModel.fromJson(Map<String, dynamic> json) => AddFileModel(
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
  int id;
  String name;
  String path;
  int classroomId;

  Data({
    required this.id,
    required this.name,
    required this.path,
    required this.classroomId,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    path: json["path"],
    classroomId: json["classroom_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "path": path,
    "classroom_id": classroomId,
  };
}
