

import 'package:e_school/models/show_absences_model.dart';

abstract class ParentAttendanceState {}

class ParentAttendanceInitial extends ParentAttendanceState {}
class ParentAttendanceLoadingState extends ParentAttendanceState {}
class ParentAttendanceSuccessState extends ParentAttendanceState {
   ShowAbsencesModel showAbsencesModel;
  ParentAttendanceSuccessState(this.showAbsencesModel);
}

class ParentAttendanceErrorState extends ParentAttendanceState {
  final String error;
  ParentAttendanceErrorState(this.error);
}
