

import 'dart:convert';

ComplaintModel complaintModelFromJson(String str) => ComplaintModel.fromJson(json.decode(str));

String complaintModelToJson(ComplaintModel data) => json.encode(data.toJson());

class ComplaintModel {
  bool? status;
  String? message;
  List<Data>? data;

  ComplaintModel({this.status, this.message, this.data});
  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
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
  Data({
  required this.complaintId,
  required this.parentId,
  required this.date,
  required this.description,
  required this.status,
  required this.createdAt,
  required this.updatedAt,
  required this.parentName,
  });
  late final int complaintId;
  late final int parentId;
  late final String date;
  late final String description;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String parentName;

  Data.fromJson(Map<String, dynamic> json){
  complaintId = json['complaint_id'];
  parentId = json['parent_id'];
  date = json['date'];
  description = json['description'];
  status = json['status'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  parentName = json['parent_name'];
  }

  Map<String, dynamic> toJson() {
  final data = <String, dynamic>{};
  data['complaint_id'] = complaintId;
  data['parent_id'] = parentId;
  data['date'] = date;
  data['description'] = description;
  data['status'] = status;
  data['created_at'] = createdAt;
  data['updated_at'] = updatedAt;
  data['parent_name'] = parentName;
  return data;
  }
  }