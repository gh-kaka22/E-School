class TeacherHomeModel {
  TeacherHomeModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  TeacherHomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.firstName,
    required this.lastName,
    required this.subjectName,
    required this.classes,
  });
  late final String firstName;
  late final String lastName;
  late final String subjectName;
  late final List<Classes> classes;

  Data.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    subjectName = json['subject_name'];
    classes = List.from(json['classes']).map((e)=>Classes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['subject_name'] = subjectName;
    _data['classes'] = classes.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Classes {
  Classes({
    required this.classroomId,
    required this.gradeId,
    required this.roomNumber,
  });
  late final int classroomId;
  late final int gradeId;
  late final String roomNumber;

  Classes.fromJson(Map<String, dynamic> json){
    classroomId = json['classroom_id'];
    gradeId = json['grade_id'];
    roomNumber = json['room_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['classroom_id'] = classroomId;
    _data['grade_id'] = gradeId;
    _data['room_number'] = roomNumber;
    return _data;
  }
  @override
  String toString() {
    return 'Classes{classroomId: $classroomId, gradeId: $gradeId, roomNumber: $roomNumber}';
  }
}