

import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_file_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/subject_model.dart';

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
class ShowClassroomsFSuccessState extends AddFileStates{
  final ClassroomModel classroomModel;
  ShowClassroomsFSuccessState(this.classroomModel);
}
class ShowClassroomsFErrorState extends AddFileStates{
  final String error;
  ShowClassroomsFErrorState(this.error);
}

//upload
class AddFileUploadLoadingState extends AddFileStates {}
class AddFileUploadSuccessState extends AddFileStates {
}
class AddFileUploadErrorState extends AddFileStates{
  final String error;
  AddFileUploadErrorState(this.error);
}