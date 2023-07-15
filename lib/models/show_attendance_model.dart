

import 'dart:convert';

ShowAttendanceModel showAttendanceModelFromJson(String str) => ShowAttendanceModel.fromJson(json.decode(str));

String showAttendanceModelToJson(ShowAttendanceModel data) => json.encode(data.toJson());


class ShowAttendanceModel {
  bool? status;
  String? message;
  List<Data>? data;

  ShowAttendanceModel({ this.status, this.message, this.data});
  factory ShowAttendanceModel.fromJson(Map<String, dynamic> json) => ShowAttendanceModel(
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
  int? id;
  int? studentId;
  String? date;
  String? createdAt;
  String? updatedAt;

  Data({required this.id,required this.studentId, required this.date, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
