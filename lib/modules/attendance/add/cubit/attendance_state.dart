part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}
class AttendanceLoadingState extends AttendanceState{}
class AttendanceSuccessState extends AttendanceState{
  final AttendanceModel attendanceModel;
  AttendanceSuccessState(this.attendanceModel);
}
class AttendanceErrorState extends AttendanceState{
  final String error;
  AttendanceErrorState(this.error);
}

///Show Students
class ShowStudentsSuccessState extends AttendanceState{
  final ShowStudentsModel showStudentsModel;
  ShowStudentsSuccessState(this.showStudentsModel);
}
class ShowStudentsErrorState extends AttendanceState{
  final String error;
  ShowStudentsErrorState(this.error);
}

///DropDown State
class ShowStudentsClassDropDownButtonState extends AttendanceState{}
class ShowStudentsSectionDropDownButtonState extends AttendanceState{}
class CheckIsAbsentState extends AttendanceState{}
///=========================================================
class ShowClassroomsXLoadingState extends AttendanceState{}
class ShowClassroomsXSuccessState extends AttendanceState{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends AttendanceState{
  final String error;
  ShowClassroomsXErrorState(this.error);
}
///===========================================================
class DateState extends AttendanceState{}
