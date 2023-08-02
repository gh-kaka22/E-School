import 'dart:convert';

ExamScheduleModel addExamScheduleModelFromJson(String str) => ExamScheduleModel.fromJson(json.decode(str));

String addExamScheduleModelToJson(ExamScheduleModel data) => json.encode(data.toJson());

class ExamScheduleModel {
  bool? status;
  String? message;
  Data? data;

  ExamScheduleModel({this.status, this.message, this.data});


  factory ExamScheduleModel.fromJson(Map<String, dynamic> json) => ExamScheduleModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  int? examScheduleId;
  String? image;
  int? gradeId;
  int? schoolYear;
  String? createdAt;
  String? updatedAt;
  String? typeId;

  Data(
      {this.examScheduleId,
        this.image,
        this.gradeId,
        this.schoolYear,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  Data.fromJson(Map<String, dynamic> json) {
    examScheduleId = json['exam_schedule_id'];
    image = json['image'];
    gradeId = json['grade_id'];
    schoolYear = json['School_Year'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_schedule_id'] = this.examScheduleId;
    data['image'] = this.image;
    data['grade_id'] = this.gradeId;
    data['School_Year'] = this.schoolYear;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_id'] = this.typeId;
    return data;
  }
}
