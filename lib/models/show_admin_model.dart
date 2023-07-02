
import 'dart:convert';

ShowAdminsModel showAdminssModelFromJson(String str) => ShowAdminsModel.fromJson(json.decode(str));

String showAdminsModelToJson(ShowAdminsModel data) => json.encode(data.toJson());

class ShowAdminsModel {
  bool? status;
  String? message;
  List<Data>? data;

  ShowAdminsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowAdminsModel.fromJson(Map<String, dynamic> json) => ShowAdminsModel(
    status: json["status"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}



class Data {
  int? id;
  String? firstName;
  String? lastName;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}