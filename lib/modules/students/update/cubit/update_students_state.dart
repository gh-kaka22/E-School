part of 'update_students_cubit.dart';

@immutable
abstract class UpdateStudentsState {}

class UpdateStudentsInitial extends UpdateStudentsState {}
class UpdateStudentsLoading  extends UpdateStudentsState {}
class UpdateStudentsSuccess extends UpdateStudentsState {
  final UpdateStudentModel updateStudentModel;
  UpdateStudentsSuccess(this.updateStudentModel);
}
class UpdateStudentsError extends UpdateStudentsState {
  final String error;
  UpdateStudentsError(this.error);
}

///=======================================================

class ShowStudentInfoLoading  extends UpdateStudentsState {}
class ShowStudentInfoSuccess extends UpdateStudentsState {
  final UpdateStudentModel updateStudentModel;
  ShowStudentInfoSuccess(this.updateStudentModel);
}
class ShowStudentInfoError extends UpdateStudentsState {
  final String error;
  ShowStudentInfoError(this.error);
}

///========================================================
class DateOfBirth extends UpdateStudentsState{}
class CheckState extends UpdateStudentsState{}
///========================================================

class ShowClassroomsSLoadingState extends UpdateStudentsState{}
class ShowClassroomsSSuccessState extends UpdateStudentsState{
final ClassroomModel classroomModel;
ShowClassroomsSSuccessState(this.classroomModel);
}
class ShowClassroomsSErrorState extends UpdateStudentsState{
  final String error;
  ShowClassroomsSErrorState(this.error);
}
class ClassDropDownButtonState extends UpdateStudentsState{}
class SectionDropDownButtonState extends UpdateStudentsState{}

///
class ClassroomsForStudentLoadingState extends UpdateStudentsState{}
class ClassroomsForStudentSuccessState extends UpdateStudentsState{
}
class ClassroomsForStudentErrorState extends UpdateStudentsState{
  final String error;
  ClassroomsForStudentErrorState(this.error);
}