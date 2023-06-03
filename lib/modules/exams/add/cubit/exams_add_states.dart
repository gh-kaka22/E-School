import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/show_exams_model.dart';


abstract class AddExamsStates {}

class AddExamsInitialState extends AddExamsStates {}
class AddExamsLoadingState extends AddExamsStates{}
class AddExamsSuccessState extends AddExamsStates{
  final AddExamsModel showExamsModel;
  AddExamsSuccessState(this.showExamsModel);
}

class AddExamsErrorState extends AddExamsStates{
  final String error;
  AddExamsErrorState(this.error);
}
class AddExamsClassDropDownButtonState extends AddExamsStates{}
class AddExamsSectionDropDownButtonState extends AddExamsStates{}
class AddExamsSubjectDropDownButtonState extends AddExamsStates{}
class AddExamsTypeDropDownButtonState extends AddExamsStates{}
