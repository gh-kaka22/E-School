part of 'add_exams_schedule_cubit.dart';

@immutable
abstract class AddExamsScheduleState {}

class AddExamsScheduleInitial extends AddExamsScheduleState {}
class AddExamsScheduleLoadingState extends AddExamsScheduleState {}
class AddExamsScheduleSuccessState extends AddExamsScheduleState {
  ExamScheduleModel examScheduleModel;
  AddExamsScheduleSuccessState(this.examScheduleModel);
}
class AddExamsScheduleErrorState extends AddExamsScheduleState {
  final String error;
  AddExamsScheduleErrorState(this.error);
}
///+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class GradechangeDropDownButton extends AddExamsScheduleState {}
class TypechangeDropDownButton extends AddExamsScheduleState {}


class SelectLoadingState extends AddExamsScheduleState {}
class SelectSuccessState extends AddExamsScheduleState {
  ExamScheduleModel examScheduleModel;
  SelectSuccessState(this.examScheduleModel);
}
class SelectErrorState extends AddExamsScheduleState {
  final String error;
  SelectErrorState(this.error);
}
