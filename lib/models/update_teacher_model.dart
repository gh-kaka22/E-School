class UpdateTeacherModel {
  bool? status;
  String? message;
  Data? data;

  UpdateTeacherModel({this.status, this.message, this.data});

  UpdateTeacherModel.fromJson(Map<String, dynamic> json) {
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
  int? teacherId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? details;
  int? subjectId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.teacherId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address,
        this.details,
        this.subjectId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    details = json['details'];
    subjectId = json['subject_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['details'] = this.details;
    data['subject_id'] = this.subjectId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
