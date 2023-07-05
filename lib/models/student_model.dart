class StudentModel {
  bool? status;
  String? message;
  Data? data;

  StudentModel({this.status, this.message, this.data});

  StudentModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? religion;
  String? address;
  String? gradeId;
  String? genderId;
  int? parentId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? studentId;
  String? parentPasswordDecoded;
  String? studentEmail;
  String?studentPasswordDecoded;
  String? fatherName;
  String? fatherPhoneNumber;
  String? motherFirstName;
  String? motherLastName;
  String? motherPhoneNumber;
  String? parentEmail;
  String? studentToken;

  Data(
      {this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.religion,
        this.address,
        this.gradeId,
        this.genderId,
        this.parentId,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.studentId,
        this.parentPasswordDecoded,
        this.studentEmail,
        this.studentPasswordDecoded,
        this.fatherName,
        this.fatherPhoneNumber,
        this.motherFirstName,
        this.motherLastName,
        this.motherPhoneNumber,
        this.parentEmail,
        this.studentToken});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    religion = json['religion'];
    address = json['address'];
    gradeId = json['grade_id'];
    genderId = json['gender_id'];
    parentId = json['parent_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    studentId = json['student_id'];
    parentPasswordDecoded = json['ParentPasswordDecoded'];
    studentEmail = json['student_email'];
    studentPasswordDecoded = json['StudentPasswordDecoded'];
    fatherName = json['father_name'];
    fatherPhoneNumber = json['father_phone_number'];
    motherFirstName = json['mother_first_name'];
    motherLastName = json['mother_last_name'];
    motherPhoneNumber = json['mother_phone_number'];
    parentEmail = json['parent_email'];
    studentToken = json['student_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['religion'] = this.religion;
    data['address'] = this.address;
    data['grade_id'] = this.gradeId;
    data['gender_id'] = this.genderId;
    data['parent_id'] = this.parentId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['student_id'] = this.studentId;
    data['ParentPasswordDecoded'] = this.parentPasswordDecoded;
    data['student_email'] = this.studentEmail;
    data['StudentPasswordDecoded'] = this.studentPasswordDecoded;
    data['father_name'] = this.fatherName;
    data['father_phone_number'] = this.fatherPhoneNumber;
    data['mother_first_name'] = this.motherFirstName;
    data['mother_last_name'] = this.motherLastName;
    data['mother_phone_number'] = this.motherPhoneNumber;
    data['parent_email'] = this.parentEmail;
    data['student_token'] = this.studentToken;
    return data;
  }
}