// To parse this JSON data, do
//
//     final parentHomeModel = parentHomeModelFromJson(jsonString);

import 'dart:convert';

ParentHomeModel parentHomeModelFromJson(String str) => ParentHomeModel.fromJson(json.decode(str));

String parentHomeModelToJson(ParentHomeModel data) => json.encode(data.toJson());

class ParentHomeModel {
  bool status;
  String message;
  Data data;

  ParentHomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ParentHomeModel.fromJson(Map<String, dynamic> json) => ParentHomeModel(
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
  int parentId;
  String fatherFirstName;
  String fatherLastName;
  String fatherPhoneNumber;
  String motherFirstName;
  String motherLastName;
  String motherPhoneNumber;
  String nationalId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Child> children;

  Data({
    required this.parentId,
    required this.fatherFirstName,
    required this.fatherLastName,
    required this.fatherPhoneNumber,
    required this.motherFirstName,
    required this.motherLastName,
    required this.motherPhoneNumber,
    required this.nationalId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.children,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    parentId: json["parent_id"],
    fatherFirstName: json["father_first_name"],
    fatherLastName: json["father_last_name"],
    fatherPhoneNumber: json["father_phone_number"],
    motherFirstName: json["mother_first_name"],
    motherLastName: json["mother_last_name"],
    motherPhoneNumber: json["mother_phone_number"],
    nationalId: json["national_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parent_id": parentId,
    "father_first_name": fatherFirstName,
    "father_last_name": fatherLastName,
    "father_phone_number": fatherPhoneNumber,
    "mother_first_name": motherFirstName,
    "mother_last_name": motherLastName,
    "mother_phone_number": motherPhoneNumber,
    "national_id": nationalId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Child {
  String kidName;
  int kidId;

  Child({
    required this.kidName,
    required this.kidId,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    kidName: json["kid_name"],
    kidId: json["kid_id"],
  );

  Map<String, dynamic> toJson() => {
    "kid_name": kidName,
    "kid_id": kidId,
  };
}
