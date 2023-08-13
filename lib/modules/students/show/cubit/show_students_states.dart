import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_result_student.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/update_student_model.dart';

abstract class ShowStudentsStates {}

class ShowStudentsInitialState extends ShowStudentsStates {}
class ShowStudentsLoadingState extends ShowStudentsStates{}
class ShowStudentsSuccessState extends ShowStudentsStates{
  final ShowStudentsModel showStudentsModel;
  ShowStudentsSuccessState(this.showStudentsModel);
}
class ShowStudentsErrorState extends ShowStudentsStates{
  final String error;
  ShowStudentsErrorState(this.error);
}


//////////////////////////////////////////////////////
class ShowStudentsClassDropDownButtonState extends ShowStudentsStates{}
class ShowStudentsSectionDropDownButtonState extends ShowStudentsStates{}

//classrooms



class ShowClassroomsSLoadingState extends ShowStudentsStates{}
class ShowClassroomsSSuccessState extends ShowStudentsStates{
  final ClassroomModel classroomModel;
  ShowClassroomsSSuccessState(this.classroomModel);
}
class ShowClassroomsSErrorState extends ShowStudentsStates{
  final String error;
  ShowClassroomsSErrorState(this.error);
}



class SearchStudentsLoadingState extends ShowStudentsStates {}
class SearchStudentsSuccessState extends ShowStudentsStates {}
class SearchStudentsErrorState extends ShowStudentsStates {
  final String error;
  SearchStudentsErrorState(this.error);
}


class ShowResultLoadingState extends ShowStudentsStates {}
class ShowResultSuccessState extends ShowStudentsStates {
  ResultStudentModel resultStudentModel;
  ShowResultSuccessState(this.resultStudentModel);
}
class ShowResultStudentsErrorState extends ShowStudentsStates {
  final String error;
  ShowResultStudentsErrorState(this.error);
}

class ShowStudentInfoLoading extends ShowStudentsStates {}
class ShowStudentInfoSuccess extends ShowStudentsStates {
  UpdateStudentModel updateStudentModel;
  ShowStudentInfoSuccess(this.updateStudentModel);
}
class ShowStudentInfoError extends ShowStudentsStates {
  final String error;
  ShowStudentInfoError(this.error);
}
