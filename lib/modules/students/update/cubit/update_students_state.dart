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
