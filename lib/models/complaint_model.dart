

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
  int? complaintId;
  int? parentId;
  String? date;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.complaintId,
        this.parentId,
        this.date,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaint_id'];
    parentId = json['parent_id'];
    date = json['date'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complaint_id'] = this.complaintId;
    data['parent_id'] = this.parentId;
    data['date'] = this.date;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
