
import 'dart:convert';

NoticeModel noticeModelFromJson(String str) => NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

class NoticeModel {
  bool? status;
  String? message;
  Data? data;

  NoticeModel({this.status, this.message, this.data});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? studentId;
  String? type;
  String? content;
  String? date;
  String? day;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {
        this.studentId,
        this.type,
        this.content,
        this.date,
        this.day,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    type = json['type'];
    content = json['content'];
    date = json['date'];
    day = json['day'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['type'] = this.type;
    data['content'] = this.content;
    data['date'] = this.date;
    data['day'] = this.day;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
