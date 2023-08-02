part of 'show_teachers_cubit.dart';

@immutable
abstract class ShowTeachersState {}

class ShowTeachersInitial extends ShowTeachersState {}
class ShowTeachersLoadingState extends ShowTeachersState {}
class ShowTeachersSuccessState extends ShowTeachersState {
  ShowTeacherModel showTeacherModel;
  ShowTeachersSuccessState(this.showTeacherModel);
}
class ShowTeachersErrorState extends ShowTeachersState {
  final String error;
  ShowTeachersErrorState(this.error);
}


class SearchTeachersLoadingState extends ShowTeachersState {}
class SearchTeachersSuccessState extends ShowTeachersState {}
class SearchTeachersErrorState extends ShowTeachersState {
  final String error;
  SearchTeachersErrorState(this.error);
}


class ScheduleInitial extends ShowTeachersState {}
class ScheduleLoading extends ShowTeachersState {}
class ScheduleSuccessState extends ShowTeachersState {
  final TeachercShedule? teachercShedule;
  ScheduleSuccessState(this.teachercShedule);

}
class ScheduleErrorState extends ShowTeachersState {
  final String error;
  ScheduleErrorState(this.error);
}
