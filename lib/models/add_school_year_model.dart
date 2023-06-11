// To parse this JSON data, do
//
//     final addSchoolYearModel = addSchoolYearModelFromJson(jsonString);

import 'dart:convert';

AddSchoolYearModel addSchoolYearModelFromJson(String str) => AddSchoolYearModel.fromJson(json.decode(str));

String addSchoolYearModelToJson(AddSchoolYearModel data) => json.encode(data.toJson());

class AddSchoolYearModel {
  bool? status;
  String? message;
  Data? data;

  AddSchoolYearModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddSchoolYearModel.fromJson(Map<String, dynamic> json) => AddSchoolYearModel(
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
  String name;
  int id;

  Data({
    required this.name,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
