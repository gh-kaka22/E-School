part of 'add_teacher_cubit.dart';

@immutable
abstract class AddTeacherState {}

class AddTeacherInitial extends AddTeacherState {}
class AddTeacherLoading extends AddTeacherState {}
class AddTeacherSuccess extends AddTeacherState {
  final TeacherModel teacher;

  AddTeacherSuccess(this.teacher);
}
class AddTeacherError extends AddTeacherState{
  final String error;
  AddTeacherError(this.error);
}
class SubjectState extends AddTeacherState{}