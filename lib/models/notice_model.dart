
import 'dart:convert';

NoticeModel noticeModelFromJson(String str) => NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());


class NoticeModel {
  bool? status;
  String? message;
  Data? data;

  NoticeModel({required this.status,required this.message,required this.data});

  factory NoticeModel.fromJson(Map<String, dynamic> json)=>NoticeModel(
      status: json ["status"],
      message: json ["message"],
      data: json['data'] != null ? Data.fromJson(json['data']) : null
  ) ;


  Map<String, dynamic> toJson() =>{
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? studentId;
  String? type;
  String? content;
  String? date;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {
        required this.studentId,
        required   this.type,
        required  this.content,
        required this.date,
          this.updatedAt,
        this.createdAt,
        required  this.id});

 factory Data.fromJson(Map<String, dynamic> json)=>Data(
      studentId:json ['studentId'],
      type:json ["type"],
      content:json ["content"],
      date:json ["date"],
       id:json ["id"],

 );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['type'] = this.type;
    data['content'] = this.content;
    data['date'] = this.date;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
