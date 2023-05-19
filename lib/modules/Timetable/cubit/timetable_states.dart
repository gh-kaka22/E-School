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