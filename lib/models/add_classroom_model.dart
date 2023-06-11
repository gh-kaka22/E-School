// To parse this JSON data, do
//
//     final addClassroomModel = addClassroomModelFromJson(jsonString);

import 'dart:convert';

AddClassroomModel addClassroomModelFromJson(String str) => AddClassroomModel.fromJson(json.decode(str));

String addClassroomModelToJson(AddClassroomModel data) => json.encode(data.toJson());

class AddClassroomModel {
  bool? status;
  String? message;
  Data? data;

  AddClassroomModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddClassroomModel.fromJson(Map<String, dynamic> json) => AddClassroomModel(
      status: json["status"],
      message: json["message"],
      data: json['data'] != null ? Data.fromJson(json['data']) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String room_number;
  String capacity;
  String grade_id;

  Data({
    required this.room_number,
    required this.capacity,
    required this.grade_id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    room_number: json["room_number"],
    capacity: json["capacity"],
    grade_id: json["grade_id"],
  );

  Map<String, dynamic> toJson() => {
    "room_number": room_number,
    "capacity": capacity,
    "grade_id": grade_id,
  };
}
