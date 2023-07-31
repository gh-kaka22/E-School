
abstract class TeacherLayoutStates{}

class TeacherLayoutInitialState extends TeacherLayoutStates{}

class TeacherLayoutBottomNavState extends TeacherLayoutStates{}


class TeacherLayoutGetSearchLoadingState extends TeacherLayoutStates{}

class TeacherLayoutGetSearchSuccessState extends TeacherLayoutStates{}

class TeacherLayoutGetSearchErrorState extends TeacherLayoutStates{
  final String error;
  TeacherLayoutGetSearchErrorState(this.error);
}

class ChangeAppModeState extends TeacherLayoutStates{}

