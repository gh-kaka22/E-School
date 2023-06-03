import 'package:untitled/models/show_exams_model.dart';


abstract class ShowExamsStates {}

class ShowExamsInitialState extends ShowExamsStates {}
class ShowExamsLoadingState extends ShowExamsStates{}
class ShowExamsSuccessState extends ShowExamsStates{
  final ShowExamsModel showExamsModel;
  ShowExamsSuccessState(this.showExamsModel);
}

class ShowExamsErrorState extends ShowExamsStates{
  final String error;
  ShowExamsErrorState(this.error);
}
class ShowExamsClassDropDownButtonState extends ShowExamsStates{}
class ShowExamsSectionDropDownButtonState extends ShowExamsStates{}
class ShowExamsSubjectDropDownButtonState extends ShowExamsStates{}
class ShowExamsTypeDropDownButtonState extends ShowExamsStates{}
