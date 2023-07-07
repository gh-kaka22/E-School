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
class CheckClassRoomState extends AddTeacherState{}
class ClassRoomSuccessState extends AddTeacherState{
  final ClassroomModel classroomModel;
  ClassRoomSuccessState(this.classroomModel);
}
class ClassRoomLoadingState extends AddTeacherState{
}
class ClassroomsErrorState extends AddTeacherState{
  final String error;
  ClassroomsErrorState(this.error);
}
