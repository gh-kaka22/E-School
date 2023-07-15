part of 'update_teacher_cubit.dart';

@immutable
abstract class UpdateTeacherState {}
//update
class UpdateTeacherInitial extends UpdateTeacherState {}
class UpdateTeacherDataLoading extends UpdateTeacherState{}
class UpdateTeacherDataSuccess extends UpdateTeacherState{
  final UpdateTeacherModel updateTeacherModel;

  UpdateTeacherDataSuccess(this.updateTeacherModel);


}
class UpdateTeacherDataError extends UpdateTeacherState{
  final String error;
  UpdateTeacherDataError(this.error);
}


//get teacher's data
class ShowTeacherDataLoading extends UpdateTeacherState{}
class ShowTeacherDataSuccess extends UpdateTeacherState{
  final UpdateTeacherModel updateTeacherModel;
  ShowTeacherDataSuccess(this.updateTeacherModel);

}
class ShowTeacherDataError extends UpdateTeacherState{
  final String error;
  ShowTeacherDataError(this.error);
}


//classrooms
class TClassRoomLoading extends UpdateTeacherState{}
class TClassRoomSuccessState extends UpdateTeacherState{
  final ClassroomModel classroomModel;
  TClassRoomSuccessState(this.classroomModel);

}
class TClassRoomErrorState extends UpdateTeacherState{
  final String error;
  TClassRoomErrorState(this.error);
}


//subjects
class ShowSubjectsLoadingState extends UpdateTeacherState{}
class ShowSubjectsSuccessState extends UpdateTeacherState{
  final SubjectModel subjectModel;
  ShowSubjectsSuccessState(this.subjectModel);

}
class ShowSubjectsErrorState extends UpdateTeacherState{
  final String error;
  ShowSubjectsErrorState(this.error);
}

class SubjectDropDownButtonState extends UpdateTeacherState{}