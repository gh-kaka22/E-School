class AddAdminModel {
  bool? status;
  String? message;
  Data? data;

  AddAdminModel({this.status, this.message, this.data});

  AddAdminModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  int? role;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? firstName;
  String? lastName;
  String? passwordDecoded;
  String? token;

  Data(
      {this.email,
        this.role,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.firstName,
        this.lastName,
        this.passwordDecoded,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    passwordDecoded = json['password_decoded'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['password_decoded'] = this.passwordDecoded;
    data['token'] = this.token;
    return data;
  }
}