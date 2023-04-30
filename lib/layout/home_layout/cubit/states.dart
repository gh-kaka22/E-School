
abstract class SchoolStates{}

class SchoolInitialState extends SchoolStates{}

class SchoolBottomNavState extends SchoolStates{}


class SchoolGetSearchLoadingState extends SchoolStates{}

class SchoolGetSearchSuccessState extends SchoolStates{}

class SchoolGetSearchErrorState extends SchoolStates{
  final String error;
  SchoolGetSearchErrorState(this.error);
}

class ChangeAppModeState extends SchoolStates{}

