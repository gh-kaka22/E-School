part of 'update_teacher_cubit.dart';

@immutable
abstract class UpdateTeacherState {}

class UpdateTeacherInitial extends UpdateTeacherState {}
class UpdateTeacherDataLoading extends UpdateTeacherState{}
class UpdateTeacherDataSuccess extends UpdateTeacherState{
  final UpdateTeacherModel updateTeacherModel;

  UpdateTeacherDataSuccess(this.updateTeacherModel);


}
class UpdateTeacherDataError extends UpdateTeacherState{
  final String error;
  UpdateTeacherDataError(this.error);
}

class ShowTeacherDataLoading extends UpdateTeacherState{}
class ShowTeacherDataSuccess extends UpdateTeacherState{
  final UpdateTeacherModel updateTeacherModel;
  ShowTeacherDataSuccess(this.updateTeacherModel);

}
class ShowTeacherDataError extends UpdateTeacherState{
  final String error;
  ShowTeacherDataError(this.error);
}