import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_Attendance_model.dart';
import 'package:untitled/models/show_students_model.dart';

abstract class ShowAttendanceStates {}

class ShowAttendanceInitialState extends ShowAttendanceStates {}
class ShowAttendanceLoadingState extends ShowAttendanceStates{}
class ShowAttendanceSuccessState extends ShowAttendanceStates{
  final ShowAttendanceModel showAttendanceModel;
  ShowAttendanceSuccessState(this.showAttendanceModel);
}
class ShowStudentsErrorState extends ShowAttendanceStates{
  final String error;
  ShowStudentsErrorState(this.error);
}


///===============================================================
class ShowStudentsSuccessState extends ShowAttendanceStates{
  final ShowStudentsModel showStudentsModel;
  ShowStudentsSuccessState(this.showStudentsModel);


}
class ShowAttendanceErrorState extends ShowAttendanceStates{
  final String error;
  ShowAttendanceErrorState(this.error);
}


///================================================================
class ShowStudentsClassDropDownButtonState extends ShowAttendanceStates{}
class ShowStudentsSectionDropDownButtonState extends ShowAttendanceStates{}
class ShowStudentsLoadingState extends ShowAttendanceStates{}

///================================================================
class ShowClassroomsXLoadingState extends ShowAttendanceStates{}
class ShowClassroomsXSuccessState extends ShowAttendanceStates{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends ShowAttendanceStates{
  final String error;
  ShowClassroomsXErrorState(this.error);
}
