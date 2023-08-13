part of 'show_notice_cubit.dart';

@immutable
abstract class ShowNoticeState {}

class ShowNoticeInitial extends ShowNoticeState {}
class ShowNoticeLoadingState extends ShowNoticeState {}
class ShowNoticeSuccessState extends ShowNoticeState {
  ShowNotesModel showNotesModel;
  ShowNoticeSuccessState(this.showNotesModel);

}
class ShowNoticeErrorState extends ShowNoticeState {
  final String error;
  ShowNoticeErrorState(this.error);
}



////////////////////////////////////////////////
class ClassDropDownButtonState extends ShowNoticeState{}
class SectionDropDownButtonState extends ShowNoticeState{}
class TypeDropDownButtonState extends ShowNoticeState{}
class ShowNoticeByType extends ShowNoticeState{}
class ShowClassroomsNLoadingState extends ShowNoticeState{}
class ShowClassroomsNSuccessState extends ShowNoticeState{
  final ClassroomModel classroomModel;
  ShowClassroomsNSuccessState(this.classroomModel);
}
class ShowClassroomsNErrorState extends ShowNoticeState{
  final String error;
  ShowClassroomsNErrorState(this.error);
}
/////////////////////////////////
class ShowStudentsSuccessState extends ShowNoticeState {
  final ShowStudentsModel showStudentsModel;

  ShowStudentsSuccessState(this.showStudentsModel);
}
class ShowStudentsErrorState extends ShowNoticeState {
  final String error;
  ShowStudentsErrorState(this.error);
}
class ShowStudentLoadingState extends ShowNoticeState {}