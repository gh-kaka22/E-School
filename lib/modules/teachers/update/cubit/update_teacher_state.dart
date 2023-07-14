part of 'update_teacher_cubit.dart';

@immutable
abstract class UpdateTeacherState {}

class UpdateTeacherInitial extends UpdateTeacherState {}
class UpdateTeacherDataLoading extends UpdateTeacherState{}
class UpdateTeacherDataSuccess extends UpdateTeacherState{
  final TeacherModel teacherModel;

  UpdateTeacherDataSuccess(this.teacherModel);


}
class UpdateTeacherDataError extends UpdateTeacherState{
  final String error;
  UpdateTeacherDataError(this.error);
}

class ShowTeacherDataLoading extends UpdateTeacherState{}
class ShowTeacherDataSuccess extends UpdateTeacherState{
  final TeacherModel teacherModel;
  ShowTeacherDataSuccess(this.teacherModel);

}
class ShowTeacherDataError extends UpdateTeacherState{
  final String error;
  ShowTeacherDataError(this.error);
}