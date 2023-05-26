abstract class ShowStudentsStates {}

class ShowStudentsInitialState extends ShowStudentsStates {}
class ShowStudentsLoadingState extends ShowStudentsStates{}
class ShowStudentsSuccessState extends ShowStudentsStates{}

class ShowStudentsErrorState extends ShowStudentsStates{
  final String error;
  ShowStudentsErrorState(this.error);
}
class ShowStudentsClassDropDownButtonState extends ShowStudentsStates{}
class ShowStudentsSectionDropDownButtonState extends ShowStudentsStates{}
