abstract class ExamsStates{}

class ExamsInitialState extends ExamsStates{}
class ExamsLoadingState extends ExamsStates{}

class ExamsSuccessState extends ExamsStates{}

class ExamsErrorState extends ExamsStates{
  final String error;
  ExamsErrorState(this.error);
}
class ExamsTypeDropDownButtonState extends ExamsStates{}
class ExamsYearDropDownButtonState extends ExamsStates{}