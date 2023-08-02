
import 'dart:convert';

TeacherModel TModelFromJson(String str) =>
    TeacherModel.fromJson(json.decode(str));

String TModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
  bool? status;
  String? message;
  Data? data;

  TeacherModel({this.status, this.message, this.data});

  TeacherModel.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'TeacherModel{status: $status, message: $message, data: $data}';
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? subjectId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? teacherId;
  String? email;
  String? passwordDecoded;
  String? token;
  String? subjectName;
  List<int>? classrooms;

  Data(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.address,
      this.subjectId,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.teacherId,
      this.email,
      this.passwordDecoded,
      this.token,
         this.subjectName,
        this.classrooms=const[],

      });

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    subjectId = json['subject_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    teacherId = json['teacher_id'];
    email = json['email'];
    passwordDecoded = json['password_decoded'];
    token = json['token'];
    subjectName = json['subject_name'];
    classrooms = json['classrooms'] != null ? List<int>.from(json['classrooms'].map((x) => x)) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['subject_id'] = this.subjectId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['teacher_id'] = this.teacherId;
    data['email'] = this.email;
    data['password_decoded'] = this.passwordDecoded;
    data['token'] = this.token;
    data['subject_name'] = this.subjectName;
    data['classrooms'] = this.classrooms;
    return data;
  }
  //
  @override
  String toString() {
    return 'Data{'
        'firstName: $firstName, '
        'lastName: $lastName, '
        'phoneNumber: $phoneNumber, '
        'address: $address, '
        'subjectId: $subjectId, '
        'userId: $userId, '
        'updatedAt: $updatedAt, '
        'createdAt: $createdAt, '
        'teacherId: $teacherId, '
        'email: $email, '
        'passwordDecoded: $passwordDecoded, '
        'token: $token, '
        'subjectName: $subjectName, '
        'classrooms: $classrooms'
        '}';
  }
}
