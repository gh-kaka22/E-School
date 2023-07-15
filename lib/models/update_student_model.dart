class UpdateStudentModel {
  bool? status;
  String? message;
  Data? data;

  UpdateStudentModel({ this.status, this.message,  this.data});

  UpdateStudentModel.fromJson(Map<String, dynamic> json) {
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
  int? studentId;
  String? firstName;
  String? lastName;
  String? religion;
  String? dateOfBirth;
  String? address;
  String? details;
  int? gradeId;
  int? genderId;
  int? parentId;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? fatherFirstName;
  String? fatherLastName;
  String? fatherPhoneNumber;
  String? motherFirstName;
  String? motherLastName;
  String? motherPhoneNumber;
  String? nationalId;


  Data(
      {this.studentId,
        this.firstName,
        this.lastName,
        this.religion,
        this.dateOfBirth,
        this.address,
        this.details,
        this.gradeId,
        this.genderId,
        this.parentId,
        this.userId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.fatherFirstName,
        this.fatherLastName,
        this.fatherPhoneNumber,
        this.motherFirstName,
        this.motherLastName,
        this.motherPhoneNumber,
        this.nationalId});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    religion = json['religion'];
    dateOfBirth = json['date_of_birth'];
    address = json['address'];
    details = json['details'];
    gradeId = json['grade_id'];
    genderId = json['gender_id'];
    parentId = json['parent_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fatherFirstName = json['father_first_name'];
    fatherLastName = json['father_last_name'];
    fatherPhoneNumber = json['father_phone_number'];
    motherFirstName = json['mother_first_name'];
    motherLastName = json['mother_last_name'];
    motherPhoneNumber = json['mother_phone_number'];
    nationalId = json['national_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['religion'] = this.religion;
    data['date_of_birth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['details'] = this.details;
    data['grade_id'] = this.gradeId;
    data['gender_id'] = this.genderId;
    data['parent_id'] = this.parentId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['father_first_name'] = this.fatherFirstName;
    data['father_last_name'] = this.fatherLastName;
    data['father_phone_number'] = this.fatherPhoneNumber;
    data['mother_first_name'] = this.motherFirstName;
    data['mother_last_name'] = this.motherLastName;
    data['mother_phone_number'] = this.motherPhoneNumber;
    data['national_id'] = this.nationalId;
    return data;
  }
}
