// To parse this JSON data, do
//
//     final showTimetableModel = showTimetableModelFromJson(jsonString);

import 'dart:convert';

ShowTimetableModel showTimetableModelFromJson(String str) => ShowTimetableModel.fromJson(json.decode(str));

String showTimetableModelToJson(ShowTimetableModel data) => json.encode(data.toJson());

class ShowTimetableModel {
  bool status;
  String message;
  Data data;

  ShowTimetableModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowTimetableModel.fromJson(Map<String, dynamic> json) => ShowTimetableModel(
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
  int classroomId;
  int dayNumber;
  String firstSubject;
  String secondSubject;
  String thirdSubject;
  String fourthSubject;
  String fifthSubject;
  String sixthSubject;
  String seventhSubject;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.classroomId,
    required this.dayNumber,
    required this.firstSubject,
    required this.secondSubject,
    required this.thirdSubject,
    required this.fourthSubject,
    required this.fifthSubject,
    required this.sixthSubject,
    required this.seventhSubject,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    classroomId: json["classroom_id"],
    dayNumber: json["day_number"],
    firstSubject: json["first_subject"],
    secondSubject: json["second_subject"],
    thirdSubject: json["third_subject"],
    fourthSubject: json["fourth_subject"],
    fifthSubject: json["fifth_subject"],
    sixthSubject: json["sixth_subject"],
    seventhSubject: json["seventh_subject"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "classroom_id": classroomId,
    "day_number": dayNumber,
    "first_subject": firstSubject,
    "second_subject": secondSubject,
    "third_subject": thirdSubject,
    "fourth_subject": fourthSubject,
    "fifth_subject": fifthSubject,
    "sixth_subject": sixthSubject,
    "seventh_subject": seventhSubject,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
