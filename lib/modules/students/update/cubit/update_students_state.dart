part of 'update_students_cubit.dart';

@immutable
abstract class UpdateStudentsState {}

class UpdateStudentsInitial extends UpdateStudentsState {}
class UpdateStudentsLoading  extends UpdateStudentsState {}
class UpdateStudentsSuccess extends UpdateStudentsState {
  final StudentModel studentModel;
  UpdateStudentsSuccess(this.studentModel);
}
class UpdateStudentsError extends UpdateStudentsState {
  final String error;
  UpdateStudentsError(this.error);
}


class ShowStudentInfoLoading  extends UpdateStudentsState {}
class ShowStudentInfoSuccess extends UpdateStudentsState {
  final StudentModel studentModel;
  ShowStudentInfoSuccess(this.studentModel);
}
class ShowStudentInfoError extends UpdateStudentsState {
  final String error;
  ShowStudentInfoError(this.error);
}
class ReligionState extends UpdateStudentsState{}
class GradeState extends UpdateStudentsState{}
class DateOfBirth extends UpdateStudentsState{}