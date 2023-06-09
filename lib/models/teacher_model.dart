
class TeacherModel {
  String? message;
  TeacherData? data;

  TeacherModel({this.message, this.data});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new TeacherData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TeacherData {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? details;
  int? subjectId;
  String? updatedAt;
  String? createdAt;
  int? teacherId;

  TeacherData(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.address,
      this.subjectId,
      this.updatedAt,
      this.createdAt,
      this.teacherId,
      this.details,});

  TeacherData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    subjectId = json['subject_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    teacherId = json['teacher_id'];
    details=json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['subject_id'] = this.subjectId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['teacher_id'] = this.teacherId;
    data['details']=this.details;
    return data;
  }
}
