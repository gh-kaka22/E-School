import 'package:e_school/models/timetable_model.dart';

abstract class ParentTimetableStates{}

class ParentTimetableInitialState extends ParentTimetableStates{}

class ParentTimetableChangeTabBarState extends ParentTimetableStates{}

class ParentTimetableLoadingState extends ParentTimetableStates{}

class ParentTimetableSuccessState extends ParentTimetableStates{
  final TimetableModel timetableModel;
  ParentTimetableSuccessState(this.timetableModel);
}

class ParentTimetableErrorState extends ParentTimetableStates{
  final String error;
  ParentTimetableErrorState(this.error);
}

class HomedataLoadingState extends ParentTimetableStates{}
class HomedataSuccessState extends ParentTimetableStates{}
class HomedataErrorState extends ParentTimetableStates{
  final String error;
  HomedataErrorState(this.error);
}