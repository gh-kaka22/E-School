class LoginModel
{
  bool? status;
  String? message;
  UserData? data;
  LoginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] != null ? UserData.fromJson(json['data']) : null ;
  }
}

class UserData
{
  int? student_id;
  String? first_name;
  String? last_name;
  String? father_first_name;
  String? father_last_name;
  String? mother_first_name;
  String? mother_last_name;
  String? email;
  String? religion;
  String? father_phone_number;
  String? mother_phone_number;
  String? address;
  String? date_of_birth;
  String? details;
  int? grade_id;
  int? gender_id;
  String? token;

  UserData.fromJson(Map<String,dynamic> json)
  {
    student_id=json['student_id'];
    first_name=json['first_name'];
    last_name=json['last_name'];
    father_first_name=json['father_first_name'];
    father_last_name=json['father_last_name'];
    mother_first_name=json['mother_first_name'];
    mother_last_name=json['mother_last_name'];
    first_name=json['first_name'];
    last_name=json['last_name'];
    email=json['email'];
    religion=json['religion'];
    father_phone_number=json['father_phone_number'];
    mother_phone_number=json['mother_phone_number'];
    address=json['address'];
    date_of_birth=json['date_of_birth'];
    details=json['details'];
    grade_id=json['grade_id'];
    gender_id=json['gender_id'];
    token=json['token'];
  }

}


















