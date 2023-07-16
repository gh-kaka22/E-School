
class EmployeeModel {
  bool? status;
  String? message;
  Data? data;

  EmployeeModel({this.status, this.message, this.data});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<EmployeeModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => EmployeeModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  EmployeeModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) => EmployeeModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );
}

class Data {
  String? firstName;
  String? lastName;
  String? job;
  String? phoneNumber;
  String? address;
  String? updatedAt;
  String? createdAt;
  int? employeeId;

  Data({this.firstName, this.lastName, this.job, this.phoneNumber, this.address, this.updatedAt, this.createdAt, this.employeeId});

  Data.fromJson(Map<String, dynamic> json) {
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
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["employee_id"] is int) {
      employeeId = json["employee_id"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["job"] = job;
    _data["phone_number"] = phoneNumber;
    _data["address"] = address;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["employee_id"] = employeeId;
    return _data;
  }

  Data copyWith({
    String? firstName,
    String? lastName,
    String? job,
    String? phoneNumber,
    String? address,
    String? updatedAt,
    String? createdAt,
    int? employeeId,
  }) => Data(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    job: job ?? this.job,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    address: address ?? this.address,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    employeeId: employeeId ?? this.employeeId,
  );
}