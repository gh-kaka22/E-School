class HomeModel
{
  bool? status;
  String? message;
  HomeData? data;
  HomeModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] != null ? HomeData.fromJson(json['data']) : null ;
  }
}

class HomeData{
  int? student_id;
  String? first_name;
  String? last_name;
  String? email;
  String? password;
  String? religion;
  String? date_of_birth;
  String? details;
  int? grade_id;
  int? gender_id;
  String? classroom;
  int? parent_id;

  HomeData.fromJson(Map<String,dynamic> json)
  {
    student_id=json['student_id'];
    first_name=json['first_name'];
    last_name=json['last_name'];
    email=json['email'];
    password=json['password'];
    religion=json['religion'];
    date_of_birth=json['date_of_birth'];
    details=json['details'];
    grade_id=json['grade_id'];
    gender_id=json['gender_id'];
    classroom=json['classroom'];
    parent_id=json['parent_id'];
  }

}