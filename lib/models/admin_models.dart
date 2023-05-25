import 'dart:convert';

class AdminModel {
  String? message;
  AdminData? data;
  String? status;

  AdminModel({this.message, this.data,this.status});
  AdminModel.fromJson(Map<String,dynamic>json)
  {
    message=json['message'];
    data=json['data'] !=null? AdminData.fromJson(json['data']) : null ;
    status=json['status'];
  }

}

class AdminData {
  String?email;
  String? password;
  String? accessToken;

AdminData({
   this.email,this.password,this.accessToken,
});
AdminData.fromJson(Map<String,dynamic>json)
{
  email=json['email'];
  password=json['password'];
  accessToken=json['accessToken'];

}



}
