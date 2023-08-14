

class StatusComplaintModel {
  bool? status;
  String? message;
  Data? data;

  StatusComplaintModel({this.status, this.message, this.data});

  StatusComplaintModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
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
    return data ;
  }
}
