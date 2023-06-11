// To parse this JSON data, do
//
//     final schoolYearModel = schoolYearModelFromJson(jsonString);

import 'dart:convert';

SchoolYearModel schoolYearModelFromJson(String str) =>
    SchoolYearModel.fromJson(json.decode(str));

String schoolYearModelToJson(SchoolYearModel data) =>
    json.encode(data.toJson());

class SchoolYearModel {
  bool? status;
  String? message;
  List<Datum>? data;

  SchoolYearModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SchoolYearModel.fromJson(Map<String, dynamic> json) =>
      SchoolYearModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
