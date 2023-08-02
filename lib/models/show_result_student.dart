import 'dart:convert';

ResultStudentModel showRSTModelFromJson(String str) => ResultStudentModel.fromJson(json.decode(str));

String showRSTModelToJson(ResultStudentModel data) => json.encode(data.toJson());


class ResultStudentModel {
  bool? status;
  String? message;
  List <Data>? data;

  ResultStudentModel({ this.status, this.message,  this.data});

  factory ResultStudentModel.fromJson(Map<String, dynamic> json) => ResultStudentModel(
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
  int? studentId;
  String? firstName;
  String? lastName;
  String? schoolYear;
  int? gradeId;
  int? result;
  int? Id;

  Data(
      {this.studentId,
        this.firstName,
        this.lastName,
        this.schoolYear,
        this.gradeId,
        this.result,
        this.Id,

     });

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    schoolYear = json['schoolYear'];
    gradeId = json['grade_id'];
    result = json['result'];
    Id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['schoolYear'] = this.schoolYear;
    data['grade_id'] = this.gradeId;
    data['result'] = this.result;
    data['id'] = this.Id;

    return data;
  }
}
