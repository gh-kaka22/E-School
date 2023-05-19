

class TimetableModel
{
  bool? status;
  String? message;
  TimetableData? data;
  TimetableModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] != null ? TimetableData.fromJson(json['data']) : null ;
  }

}
class TimetableData
{
  int? classroom_id;
  int? day_number;
  String? firstSubject;
  String? secondSubject;
  String? thirdSubject;
  String? fourthSubject;
  String? fifthSubject;
  String? sixthSubject;
  String? seventhSubject;

  TimetableData.fromJson(Map<String,dynamic> json)
  {

    classroom_id=json['classroom_id'];
    day_number=json['day_number'];
    firstSubject=json['first_subject'] ;
    secondSubject=json['second_subject'];
    thirdSubject=json['third_subject'] ;
    fourthSubject=json['fourth_subject'] ;
    fifthSubject=json['fifth_subject']  ;
    sixthSubject=json['sixth_subject']  ;
    seventhSubject=json['seventh_subject'] ;

  }

}


