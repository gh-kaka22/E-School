part of 'show_exam_schedule_cubit.dart';

@immutable
abstract class ShowExamScheduleState {}

class ShowExamScheduleInitial extends ShowExamScheduleState {}
class ShowExamScheduleLoadingState extends ShowExamScheduleState {}
class ShowExamScheduleSuccessState extends ShowExamScheduleState {
  ShowExamScheduleModel showExamScheduleModel;
  ShowExamScheduleSuccessState(this.showExamScheduleModel);
}
class ShowExamScheduleErrorState extends ShowExamScheduleState {
  final String error;
  ShowExamScheduleErrorState(this.error);
}

class ExamsTypeDropDownButtonState extends ShowExamScheduleState {}
class ExamsClassDropDownButtonState extends ShowExamScheduleState {}