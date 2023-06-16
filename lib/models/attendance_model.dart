
class AttendanceModel {
  bool? status;
  String? message;
  List<Data>? data;

  AttendanceModel({this.status, this.message, this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.message = json["message"];
    this.data = json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if(this.data != null)
      data["data"] = this.data?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Data {
  int? id;
  int? studentId;
  String? date;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.studentId, this.date, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.studentId = json["student_id"];
    this.date = json["date"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["student_id"] = this.studentId;
    data["date"] = this.date;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}