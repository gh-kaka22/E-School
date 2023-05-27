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
