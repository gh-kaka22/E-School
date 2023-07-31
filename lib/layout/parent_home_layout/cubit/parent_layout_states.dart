
abstract class ParentLayoutStates{}

class ParentLayoutInitialState extends ParentLayoutStates{}

class ParentLayoutBottomNavState extends ParentLayoutStates{}


class ParentLayoutGetSearchLoadingState extends ParentLayoutStates{}

class ParentLayoutGetSearchSuccessState extends ParentLayoutStates{}

class ParentLayoutGetSearchErrorState extends ParentLayoutStates{
  final String error;
  ParentLayoutGetSearchErrorState(this.error);
}

class ChangeAppModeState extends ParentLayoutStates{}

