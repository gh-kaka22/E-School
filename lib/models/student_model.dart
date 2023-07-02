import 'dart:convert';

class StudentModel {
  String? message;
  Data? data;

  StudentModel({this.message, this.data});

  StudentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? fatherName;
  String? fatherPhoneNumber;
  String? motherFirstName;
  String? motherLastName;
  String? motherPhoneNumber;
  String? religion;
  String? address;
  String? gradenumber;
  String? details;
  String? email;
  int? havekids;
  String? genderId;
  String? updatedAt;
  String? createdAt;
  int? studentId;
  int? passwordDecoded;



  String? accessToken;
  int? fatherId;
  int? motherId;

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    religion = json['religion'];
    address = json['address'];
    gradenumber = json['grade_id'];
    details = json['details'];
    email = json['email'];
    genderId = json['gender_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    studentId = json['student_id'];
    passwordDecoded = json['PasswordDecoded'];
    fatherName = json['father_name'];
    fatherPhoneNumber = json['father_phone_number'];
    motherFirstName = json['mother_first_name'];
    motherLastName = json['mother_last_name'];
    motherPhoneNumber = json['mother_phone_number'];
    accessToken = json['accessToken'];
    fatherId = json['father_id'];
    motherId = json['mother_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['religion'] = this.religion;
    data['address'] = this.address;
    data['grade_id'] = this.gradenumber;
    data['details'] = this.details;
    data['email'] = this.email;
    data['gender_id'] = this.genderId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['student_id'] = this.studentId;
    data['PasswordDecoded'] = this.passwordDecoded;
    data['father_name'] = this.fatherName;
    data['father_phone_number'] = this.fatherPhoneNumber;
    data['mother_first_name'] = this.motherFirstName;
    data['mother_last_name'] = this.motherLastName;
    data['mother_phone_number'] = this.motherPhoneNumber;
    data['accessToken'] = this.accessToken;
    data['father_id'] = this.fatherId;
    data['mother_id'] = this.motherId;

    return data;
  }
}
