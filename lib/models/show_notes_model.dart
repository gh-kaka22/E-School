

import 'dart:convert';

ShowNotesModel showNotesModelFromJson(String str) => ShowNotesModel.fromJson(json.decode(str));

String showNotesModelToJson(ShowNotesModel data) => json.encode(data.toJson());



class ShowNotesModel {
  bool? status;
  String? message;
  List<Data>? data;

  ShowNotesModel({ this.status,  this.message,  this.data});

  ShowNotesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList());

    }
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


class Data {
  int? id;
  int? studentId;
  String? type;
  String? content;
  String? date;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.studentId,
        this.type,
        this.content,
        this.date,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    type = json['type'];
    content = json['content'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['type'] = this.type;
    data['content'] = this.content;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}