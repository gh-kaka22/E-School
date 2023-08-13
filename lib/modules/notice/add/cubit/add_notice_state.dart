part of 'add_notice_cubit.dart';

@immutable
abstract class AddNoticeState {}

class AddNoticeInitial extends AddNoticeState {}
class AddNoticeLoadingState extends AddNoticeState {}
class AddNoticeModelState extends AddNoticeState{
  final NoticeModel noticeModel;
  AddNoticeModelState(this.noticeModel);
}
class AddNoticeErrorState extends AddNoticeState {
  final String error;
  AddNoticeErrorState(this.error);
}
////////////////////////////////////////////////////////////////////////////////


class ShowClassroomsXLoadingState extends AddNoticeState{}
class ShowClassroomsXSuccessState extends AddNoticeState{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends AddNoticeState{
  final String error;
  ShowClassroomsXErrorState(this.error);
}

/////////////////////////////////////////////
class ShowStudentLoadingState extends AddNoticeState {}
class ShowStudentsSuccessState extends AddNoticeState {
  final ShowStudentsModel showStudentsModel;

  ShowStudentsSuccessState(this.showStudentsModel);
}
class ShowStudentsErrorState extends AddNoticeState{
  final String error;
  ShowStudentsErrorState(this.error);
}

////////////////////////////////////////////////////
class DateState extends AddNoticeState{}
class AddNoticeType extends AddNoticeState{}
class ClassDropDownButtonState extends AddNoticeState{}
class SectionDropDownButtonState extends AddNoticeState{}