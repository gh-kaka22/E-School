

import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/add_timetable_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_timetable_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class ShowTimetableStates {}

class ShowTimetableInitialState extends ShowTimetableStates {}
class ShowTimetableLoadingState extends ShowTimetableStates {}
class ShowTimetableSuccessState extends ShowTimetableStates {
  final ShowTimetableModel showTimetableModel;

  ShowTimetableSuccessState(this.showTimetableModel);
}
class ShowTimetableErrorState extends ShowTimetableStates{
  final String error;
  ShowTimetableErrorState(this.error);
}


class ShowTimetableClassDropDownButtonState extends ShowTimetableStates {}
class ShowTimetableSectionDropDownButtonState extends ShowTimetableStates {}
class ShowTimetableDayDropDownButtonState extends ShowTimetableStates {}



//classrooms



class ShowClassroomsTLoadingState extends ShowTimetableStates{}
class ShowClassroomsTSuccessState extends ShowTimetableStates{
  final ClassroomModel classroomModel;
  ShowClassroomsTSuccessState(this.classroomModel);
}
class ShowClassroomsTErrorState extends ShowTimetableStates{
  final String error;
  ShowClassroomsTErrorState(this.error);
}

