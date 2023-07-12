class ProfileModel
{
  bool? status;
  String? message;
  ProfileData? data;
  ProfileModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] != null ? ProfileData.fromJson(json['data']) : null ;
  }
}

class ProfileData{
  int? student_id;
  String? first_name;
  String? last_name;
  String? email;
  String? religion;
  String? date_of_birth;
  String? details;
  int? grade_id;
  int? gender_id;
  String? classroom;
  int? parent_id;
  String? father_first_name;
  String? mother_first_name;
  String? mother_last_name;
  String? address;


  ProfileData.fromJson(Map<String,dynamic> json)
  {
    student_id=json['student_id'];
    first_name=json['first_name'];
    last_name=json['last_name'];
    email=json['email'];
    address=json['address'];
    father_first_name=json['father_first_name'];
    mother_first_name=json['mother_first_name'];
    mother_last_name=json['mother_last_name'];
    religion=json['religion'];
    date_of_birth=json['date_of_birth'];
    details=json['details'];
    grade_id=json['grade_id'];
    gender_id=json['gender_id'];
    classroom=json['classroom'];
    parent_id=json['parent_id'];
  }

}