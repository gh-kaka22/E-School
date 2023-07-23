import 'dart:convert';

NotesModel showNotesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));

String showNotessModelToJson(NotesModel data) => json.encode(data.toJson());
class NotesModel {
  bool? status;
  String? message;
  List<Data>? data;

  NotesModel({this.status, this.message, this.data});

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
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
