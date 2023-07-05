// To parse this JSON data, do
//
//     final addTimetableModel = addTimetableModelFromJson(jsonString);

import 'dart:convert';

AddTimetableModel addTimetableModelFromJson(String str) => AddTimetableModel.fromJson(json.decode(str));

String addTimetableModelToJson(AddTimetableModel data) => json.encode(data.toJson());

class AddTimetableModel {
  bool status;
  String message;
  Data? data;

  AddTimetableModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddTimetableModel.fromJson(Map<String, dynamic> json) => AddTimetableModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? Data.fromJson(json["data"]) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String dayNumber;
  String firstSubject;
  String secondSubject;
  String thirdSubject;
  String fourthSubject;
  String fifthSubject;
  String sixthSubject;
  int classroomId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.dayNumber,
    required this.firstSubject,
    required this.secondSubject,
    required this.thirdSubject,
    required this.fourthSubject,
    required this.fifthSubject,
    required this.sixthSubject,
    required this.classroomId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dayNumber: json["day_number"],
    firstSubject: json["first_subject"],
    secondSubject: json["second_subject"],
    thirdSubject: json["third_subject"],
    fourthSubject: json["fourth_subject"],
    fifthSubject: json["fifth_subject"],
    sixthSubject: json["sixth_subject"],
    classroomId: json["classroom_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "day_number": dayNumber,
    "first_subject": firstSubject,
    "second_subject": secondSubject,
    "third_subject": thirdSubject,
    "fourth_subject": fourthSubject,
    "fifth_subject": fifthSubject,
    "sixth_subject": sixthSubject,
    "classroom_id": classroomId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
