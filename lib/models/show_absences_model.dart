import 'dart:convert';

ShowAbsencesModel showAbsencesModelFromJson(String str) => ShowAbsencesModel.fromJson(json.decode(str));

String showAbsencesModelToJson(ShowAbsencesModel data) => json.encode(data.toJson());
class ShowAbsencesModel {
  bool? status;
  String? message;
  List<Data>? data;

  ShowAbsencesModel({this.status, this.message, this.data});

  factory ShowAbsencesModel.fromJson(Map<String, dynamic> json) => ShowAbsencesModel(
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
  String? day;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.studentId,
        this.date,
        this.day,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    date = json['date'];
    day = json['day'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['date'] = this.date;
    data['day'] = this.day;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
