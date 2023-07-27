part of 'profile_teacher_cubit.dart';

@immutable
abstract class ProfileTeacherState {}

class ProfileTeacherInitial extends ProfileTeacherState {}
class ProfileTeacherLoadingState extends ProfileTeacherState {}
class ProfileTeacherSuccessState extends ProfileTeacherState {
  ProfileTeacher profileTeacher;
  ProfileTeacherSuccessState(this.profileTeacher);
}
class ProfileTeacherErrorState extends ProfileTeacherState {
  final String error;
  ProfileTeacherErrorState(this.error);

}
