part of 'exam_schedule_cubit.dart';

@immutable
abstract class ExamScheduleState {}

class ExamScheduleInitial extends ExamScheduleState {}
class ShowExamScheduleLoadingState extends ExamScheduleState {}
class ShowExamScheduleSuccessState extends ExamScheduleState {
  ShowExamScheduleModel showExamScheduleModel;
  ShowExamScheduleSuccessState(this.showExamScheduleModel);
}
class ShowExamScheduleErrorState extends ExamScheduleState {
  final String error;
  ShowExamScheduleErrorState(this.error);
}


class ExamsTypeDropDownButtonState extends ExamScheduleState {}
class ExamsClassDropDownButtonState extends ExamScheduleState {}