import 'package:e_school/models/timetable_model.dart';

abstract class TimetableStates{}

class TimetableInitialState extends TimetableStates{}

class TimeTableChangeTabBarState extends TimetableStates{}

class TimeTableLoadingState extends TimetableStates{}

class TimeTableSuccessState extends TimetableStates{
  final TimetableModel timetableModel;
  TimeTableSuccessState(this.timetableModel);
}

class TimeTableErrorState extends TimetableStates{
  final String error;
  TimeTableErrorState(this.error);
}

class HomedataLoadingState extends TimetableStates{}
class HomedataSuccessState extends TimetableStates{}
class HomedataErrorState extends TimetableStates{
  final String error;
  HomedataErrorState(this.error);
}