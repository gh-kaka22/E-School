abstract class ParentProfileStates{}

class ParentProfileInitialState extends ParentProfileStates{}

class ParentProfileLoadingState extends ParentProfileStates{}

class ParentProfileSuccessState extends ParentProfileStates{}

class ParentProfileErrorState extends ParentProfileStates{
  final String error;
  ParentProfileErrorState(this.error);
}
