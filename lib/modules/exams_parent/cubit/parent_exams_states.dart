abstract class ParentExamsStates{}

class ParentExamsInitialState extends ParentExamsStates{}
class ParentExamsLoadingState extends ParentExamsStates{}

class ParentExamsSuccessState extends ParentExamsStates{}

class ParentExamsErrorState extends ParentExamsStates{
  final String error;
  ParentExamsErrorState(this.error);
}
class ParentExamsTypeDropDownButtonState extends ParentExamsStates{}
class ParentExamsYearDropDownButtonState extends ParentExamsStates{}