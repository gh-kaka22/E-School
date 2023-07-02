part of 'add_notice_cubit.dart';

@immutable
abstract class AddNoticeState {}

class AddNoticeInitial extends AddNoticeState {}
class AddNoticeLoadingState extends AddNoticeState {}
class ShowExamSuccessState extends AddNoticeState {
  final AddExamsModel showExamsModel;

  ShowExamSuccessState(this.showExamsModel);
}
class AddNoticeModelState extends AddNoticeState{
  final NoticeModel noticeModel;
  AddNoticeModelState(this.noticeModel);
}
class AddNoticeErrorState extends AddNoticeState {
  final String error;
  AddNoticeErrorState(this.error);
}

class ClassDropDownButtonState extends AddNoticeState{}
class SectionDropDownButtonState extends AddNoticeState{}

class ShowClassroomsXLoadingState extends AddNoticeState{}
class ShowClassroomsXSuccessState extends AddNoticeState{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends AddNoticeState{
  final String error;
  ShowClassroomsXErrorState(this.error);
}
class DateState extends AddNoticeState{}

class AddNoticeType extends AddNoticeState{}