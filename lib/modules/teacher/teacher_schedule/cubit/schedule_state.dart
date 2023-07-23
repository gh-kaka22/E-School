part of 'schedule_cubit.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}
class ScheduleLoading extends ScheduleState {}
class ScheduleSuccessState extends ScheduleState {
  final TeachercShedule? teachercShedule;
  ScheduleSuccessState(this.teachercShedule);

}
class ScheduleErrorState extends ScheduleState {
  final String error;
  ScheduleErrorState(this.error);
}

class changDayState extends ScheduleState {
}



