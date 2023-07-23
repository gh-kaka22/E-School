part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}
class AttendanceLoadingState extends AttendanceState {}
class AttendanceSuccessState extends AttendanceState {
  ShowAbsencesModel showAbsencesModel;
  AttendanceSuccessState(this.showAbsencesModel);
}

class AttendanceErrorState extends AttendanceState {
  final String error;
  AttendanceErrorState(this.error);
}
