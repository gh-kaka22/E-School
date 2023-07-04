import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_students_model.dart';

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