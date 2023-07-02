part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}
class AttendanceLoadingState extends AttendanceState{}
class AttendanceSuccessState extends AttendanceState{
  final AttendanceModel attendanceModel;
  AttendanceSuccessState(this.attendanceModel);
}
class AddExamsSuccessState extends AttendanceState{
  final AddExamsModel showExamsModel;
  AddExamsSuccessState(this.showExamsModel);
}
class AddExamsEnteredSuccessState extends AttendanceState{
  final AddExamsEnteredModel addExamsEnteredModel;
  AddExamsEnteredSuccessState(this.addExamsEnteredModel);
}

class AttendanceErrorState extends AttendanceState{
  final String error;
  AttendanceErrorState(this.error);
}
class ShowStudentsClassDropDownButtonState extends AttendanceState{}
class ShowStudentsSectionDropDownButtonState extends AttendanceState{}
class CheckIsAbsentState extends AttendanceState{}

class ShowClassroomsXLoadingState extends AttendanceState{}
class ShowClassroomsXSuccessState extends AttendanceState{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends AttendanceState{
  final String error;
  ShowClassroomsXErrorState(this.error);
}

class DateState extends AttendanceState{}
class ShowStudentsSuccessState extends AttendanceState{
  final AddExamsModel addExamsModel;
  ShowStudentsSuccessState(this.addExamsModel);
}