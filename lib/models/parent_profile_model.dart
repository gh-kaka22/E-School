
class ParentProfileModel {
  bool? status;
  String? message;
  Data? data;

  ParentProfileModel({this.status, this.message, this.data});

  ParentProfileModel.fromJson(Map<String, dynamic> json) {
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

  static List<ParentProfileModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ParentProfileModel.fromJson(map)).toList();
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
}

class Data {
  String? firstName;
  String? lastName;
  String? motherFirstName;
  String? motherLastName;
  String? fatherPhoneNumber;
  String? motherPhoneNumber;
  String? nationalId;
  int? kids;

  Data({this.firstName, this.lastName, this.motherFirstName, this.motherLastName, this.fatherPhoneNumber, this.motherPhoneNumber, this.nationalId, this.kids});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["first name"] is String) {
      firstName = json["first name"];
    }
    if(json["last name"] is String) {
      lastName = json["last name"];
    }
    if(json["mother first name"] is String) {
      motherFirstName = json["mother first name"];
    }
    if(json["mother last name"] is String) {
      motherLastName = json["mother last name"];
    }
    if(json["father phone number"] is String) {
      fatherPhoneNumber = json["father phone number"];
    }
    if(json["mother phone number"] is String) {
      motherPhoneNumber = json["mother phone number"];
    }
    if(json["national id"] is String) {
      nationalId = json["national id"];
    }
    if(json["kids"] is int) {
      kids = json["kids"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["first name"] = firstName;
    _data["last name"] = lastName;
    _data["mother first name"] = motherFirstName;
    _data["mother last name"] = motherLastName;
    _data["father phone number"] = fatherPhoneNumber;
    _data["mother phone number"] = motherPhoneNumber;
    _data["national id"] = nationalId;
    _data["kids"] = kids;
    return _data;
  }
}