import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_file_model.dart';
import 'package:untitled/models/show_students_model.dart';

abstract class ShowFilesStates {}

class ShowFilesInitialState extends ShowFilesStates {}
class ShowFilesLoadingState extends ShowFilesStates{}
class ShowFilesSuccessState extends ShowFilesStates{
  final ShowFileModel showFileModel;
  ShowFilesSuccessState(this.showFileModel);
}

class ShowFilesErrorState extends ShowFilesStates{
  final String error;
  ShowFilesErrorState(this.error);
}
class ShowFilesClassDropDownButtonState extends ShowFilesStates{}
class ShowFilesSectionDropDownButtonState extends ShowFilesStates{}

//classrooms



class ShowClassroomsFSLoadingState extends ShowFilesStates{}
class ShowClassroomsFSSuccessState extends ShowFilesStates{
  final ClassroomModel classroomModel;
  ShowClassroomsFSSuccessState(this.classroomModel);
}
class ShowClassroomsFSErrorState extends ShowFilesStates{
  final String error;
  ShowClassroomsFSErrorState(this.error);
}