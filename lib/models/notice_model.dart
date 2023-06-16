class NoticeModel {
  bool? status;
  String? message;
  Data? data;

  NoticeModel({required this.status,required this.message,required this.data});

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
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {
        required this.studentId,
        required   this.type,
        required  this.content,
        required this.date,
        required   this.updatedAt,
        required   this.createdAt,
        required  this.id});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    type = json['type'];
    content = json['content'];
    date = json['date'];
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
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
