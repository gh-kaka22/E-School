
class ShowEmployeeModel {
  bool? status;
  String? message;
  List<Data>? data;

  ShowEmployeeModel({this.status, this.message, this.data});

  ShowEmployeeModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  static List<ShowEmployeeModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ShowEmployeeModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ShowEmployeeModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) => ShowEmployeeModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );
}

class Data {
  int? employeeId;
  String? firstName;
  String? lastName;
  String? job;
  String? phoneNumber;
  String? address;
  String? details;
  String? createdAt;
  String? updatedAt;

  Data({this.employeeId, this.firstName, this.lastName, this.job, this.phoneNumber, this.address, this.details, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["employee_id"] is int) {
      employeeId = json["employee_id"];
    }
    if(json["first_name"] is String) {
      firstName = json["first_name"];
    }
    if(json["last_name"] is String) {
      lastName = json["last_name"];
    }
    if(json["job"] is String) {
      job = json["job"];
    }
    if(json["phone_number"] is String) {
      phoneNumber = json["phone_number"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["details"] is String) {
      details = json["details"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["employee_id"] = employeeId;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["job"] = job;
    _data["phone_number"] = phoneNumber;
    _data["address"] = address;
    _data["details"] = details;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  Data copyWith({
    int? employeeId,
    String? firstName,
    String? lastName,
    String? job,
    String? phoneNumber,
    String? address,
    String? details,
    String? createdAt,
    String? updatedAt,
  }) => Data(
    employeeId: employeeId ?? this.employeeId,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    job: job ?? this.job,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    address: address ?? this.address,
    details: details ?? this.details,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}