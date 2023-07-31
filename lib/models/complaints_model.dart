import 'dart:convert';

ComplaintModel showCompModelFromJson(String str) => ComplaintModel.fromJson(json.decode(str));

String showCompModelToJson(ComplaintModel data) => json.encode(data.toJson());

class ComplaintModel {
  bool? status;
  String? message;
  Data? data;

  ComplaintModel({this.status, this.message, this.data});

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
      status: json["status"],
      message: json["message"],
      data: json['data'] != null ? Data.fromJson(json['data']) : null
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? parentId;
  String? date;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? complaintId;

  Data(
      {this.parentId,
        this.date,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.complaintId});

  Data.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    date = json['date'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    complaintId = json['complaint_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_id'] = this.parentId;
    data['date'] = this.date;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['complaint_id'] = this.complaintId;
    return data;
  }
}
