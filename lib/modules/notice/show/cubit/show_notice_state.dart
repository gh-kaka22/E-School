part of 'show_notice_cubit.dart';

@immutable
abstract class ShowNoticeState {}

class ShowNoticeInitial extends ShowNoticeState {}
class ShowNoticeLoadingState extends ShowNoticeState {}
class ShowNoticeSuccessState extends ShowNoticeState {
  //todo:showmodel

}
class ShowNoticeErrorState extends ShowNoticeState {
  final String error;
  ShowNoticeErrorState(this.error);
}
class ClassDropDownButtonState extends ShowNoticeState{}
class SectionDropDownButtonState extends ShowNoticeState{}
class TypeDropDownButtonState extends ShowNoticeState{}
class ShowNoticeByType extends ShowNoticeState{}

class ShowExamSuccessState extends ShowNoticeState {
  final AddExamsModel showExamsModel;

  ShowExamSuccessState(this.showExamsModel);
}