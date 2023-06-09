part of 'update_teacher_cubit.dart';

@immutable
abstract class UpdateTeacherState {}

class UpdateTeacherInitial extends UpdateTeacherState {}
class TeacherDataLoading extends UpdateTeacherState{}
class TeacherDataSuccess extends UpdateTeacherState{
  final TeacherModel teacherModel;

  TeacherDataSuccess(this.teacherModel);

}
class TeacherDataError extends UpdateTeacherState{}
class UpdateTeacherDataLoading extends UpdateTeacherState{}
class UpdateTeacherDataSuccess extends UpdateTeacherState{
  final TeacherModel teacherModel;

  UpdateTeacherDataSuccess(this.teacherModel);


}
class UpdateTeacherDataError extends UpdateTeacherState{}

