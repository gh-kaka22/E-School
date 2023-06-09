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
class ShowStudentsClassDropDownButtonState extends AttendanceState{}
class ShowStudentsSectionDropDownButtonState extends AttendanceState{}

