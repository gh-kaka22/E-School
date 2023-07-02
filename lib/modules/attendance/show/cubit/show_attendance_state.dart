import 'package:untitled/models/show_Attendance_model.dart';
import 'package:untitled/models/show_students_model.dart';

abstract class ShowAttendanceStates {}

class ShowAttendanceInitialState extends ShowAttendanceStates {}
class ShowAttendanceLoadingState extends ShowAttendanceStates{}
class ShowAttendanceSuccessState extends ShowAttendanceStates{
  final ShowAttendanceModel showAttendanceModel;
  ShowAttendanceSuccessState(this.showAttendanceModel);
}
class ShowStudentsSuccessState extends ShowAttendanceStates{
  final ShowStudentsModel showStudentsModel;
  ShowStudentsSuccessState(this.showStudentsModel);


}
class ShowStudentsErrorState extends ShowAttendanceStates{
  final String error;
  ShowStudentsErrorState(this.error);
}

class ShowAttendanceErrorState extends ShowAttendanceStates{
  final String error;
  ShowAttendanceErrorState(this.error);
}
class ShowStudentsClassDropDownButtonState extends ShowAttendanceStates{}
class ShowStudentsSectionDropDownButtonState extends ShowAttendanceStates{}
class ShowStudentsLoadingState extends ShowAttendanceStates{}
