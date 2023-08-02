
import 'dart:convert';

ShowExamScheduleModel showModelFromJson(String str) => ShowExamScheduleModel.fromJson(json.decode(str));

String showModelToJson(ShowExamScheduleModel data) => json.encode(data.toJson());


class ShowExamScheduleModel {
  bool status;
  String message;
  List<Data>? data;

  ShowExamScheduleModel({required this.status,required this.message, this.data});

  factory ShowExamScheduleModel.fromJson(Map<String, dynamic> json) => ShowExamScheduleModel(
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
  int? typeId;
  int? examScheduleId;
  String? createdAt;
  String? updatedAt;
  String? image;
  int? gradeId;
  int? schoolYear;

  Data(
      {
         this.id,
        this.typeId,
        this.examScheduleId,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.gradeId,
       this.schoolYear});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    examScheduleId = json['exam_schedule_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    gradeId = json['grade_id'];
    schoolYear = json['School_Year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['exam_schedule_id'] = this.examScheduleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['grade_id'] = this.gradeId;
    data['School_Year'] = this.schoolYear;
    return data;
  }
}
