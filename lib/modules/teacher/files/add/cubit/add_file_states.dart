

import 'package:e_school/models/add_file_model.dart';
import 'package:e_school/models/classroom_model.dart';
import 'package:e_school/models/teacher_home_model.dart';

abstract class AddFileStates {}

class AddFileInitialState extends AddFileStates {}
class AddFileLoadingState extends AddFileStates {}
class AddFileSuccessState extends AddFileStates {
  final AddFileModel addFileModel;

  AddFileSuccessState(this.addFileModel);
}
class AddFileErrorState extends AddFileStates{
  final String error;
  AddFileErrorState(this.error);
}

//dropdowns
class AddFileClassDropDownButtonState extends AddFileStates{}
class AddFileSectionDropDownButtonState extends AddFileStates{}


//classrooms
class ShowClassroomsFLoadingState extends AddFileStates{}
class ShowClassroomsFSuccessState extends AddFileStates {
  final TeacherHomeModel teacherHomeModel;

  ShowClassroomsFSuccessState(this.teacherHomeModel);
}
class ShowClassroomsFErrorState extends AddFileStates{
  final String error;
  ShowClassroomsFErrorState(this.error);
}
//roomNumber
class RoomNumberFLoadingState extends AddFileStates{}
class RoomNumberFSuccessState extends AddFileStates {
  final TeacherHomeModel teacherHomeModel;

  RoomNumberFSuccessState(this.teacherHomeModel);
}
class RoomNumberFErrorState extends AddFileStates{
  final String error;
  RoomNumberFErrorState(this.error);
}
//upload
class AddFileUploadLoadingState extends AddFileStates {}
class AddFileUploadSuccessState extends AddFileStates {
}
class AddFileUploadErrorState extends AddFileStates{
  final String error;
  AddFileUploadErrorState(this.error);
}