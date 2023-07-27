import 'dart:convert';

TeachercShedule tSchModelFromJson(String str) => TeachercShedule.fromJson(json.decode(str));

String tSchModelToJson(TeachercShedule data) => json.encode(data.toJson());


class TeachercShedule {
  bool? status;
  String? message;
  Data? data;

  TeachercShedule({this.status, this.message, this.data});

  TeachercShedule.fromJson(Map<String, dynamic> json) {
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
  int? dayNumber;
  String? firstPeriod;
  String? secondPeriod;
  String? thirdPeriod;
  String? forthPeriod;
  String? fifthPeriod;
  String? sixthPeriod;
  Null? seventhPeriod;

  Data(
      {this.dayNumber,
        this.firstPeriod,
        this.secondPeriod,
        this.thirdPeriod,
        this.forthPeriod,
        this.fifthPeriod,
        this.sixthPeriod,
        this.seventhPeriod});

  Data.fromJson(Map<String, dynamic> json) {
    dayNumber = json['day_number'];
    firstPeriod = json['First Period'];
    secondPeriod = json['Second Period'];
    thirdPeriod = json['Third Period'];
    forthPeriod = json['Forth Period'];
    fifthPeriod = json['Fifth Period'];
    sixthPeriod = json['Sixth Period'];
    seventhPeriod = json['Seventh Period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_number'] = this.dayNumber;
    data['First Period'] = this.firstPeriod;
    data['Second Period'] = this.secondPeriod;
    data['Third Period'] = this.thirdPeriod;
    data['Forth Period'] = this.forthPeriod;
    data['Fifth Period'] = this.fifthPeriod;
    data['Sixth Period'] = this.sixthPeriod;
    data['Seventh Period'] = this.seventhPeriod;
    return data;
  }
}
