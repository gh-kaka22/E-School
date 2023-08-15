part of 'exam_schedule_cubit.dart';



@immutable
abstract class ExamScheduleParentState {}

class ExamScheduleParentInitial extends ExamScheduleParentState {}
class ShowExamScheduleParentLoadingState extends ExamScheduleParentState {}
class ShowExamScheduleParentSuccessState extends ExamScheduleParentState {
  ExamScheduleModel showExamScheduleModel;
  ShowExamScheduleParentSuccessState(this.showExamScheduleModel);
}
class ShowExamScheduleParentErrorState extends ExamScheduleParentState {
  final String error;
  ShowExamScheduleParentErrorState(this.error);
}


class ExamsTypeDropDownButtonState extends ExamScheduleParentState {}
class ExamsClassDropDownButtonState extends ExamScheduleParentState {}