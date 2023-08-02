
import 'dart:convert';

ShowTeacherModel showTeacherModelFromJson(String str) => ShowTeacherModel.fromJson(json.decode(str));

String showTeacherModelToJson(ShowTeacherModel data) => json.encode(data.toJson());


class ShowTeacherModel {
  bool? status;
  String? message;
  List<Data>? data;

  ShowTeacherModel({this.status, this.message, this.data});

  factory ShowTeacherModel.fromJson(Map<String, dynamic> json) => ShowTeacherModel(
    status: json["status"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  int? teacherId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? details;
  int? subjectId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? subjectName;
  List<int>? classrooms;

  Data(
      {this.teacherId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address,
        this.details,
        this.subjectId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.subjectName,
        this.classrooms});

  Data.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    details = json['details'];
    subjectId = json['subject_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subjectName = json['subject_name'];
    classrooms = json['classrooms'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['details'] = this.details;
    data['subject_id'] = this.subjectId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subject_name'] = this.subjectName;
    data['classrooms'] = this.classrooms;
    return data;
  }
}
