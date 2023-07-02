

import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/add_timetable_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class AddTimetableStates {}

class AddTimetableInitialState extends AddTimetableStates {}
class AddTimetableLoadingState extends AddTimetableStates {}
class AddTimetableSuccessState extends AddTimetableStates {
  final AddTimetableModel addTimetableModel;

  AddTimetableSuccessState(this.addTimetableModel);
}
class AddTimetableErrorState extends AddTimetableStates{
  final String error;
  AddTimetableErrorState(this.error);
}


class AddTimetableClassDropDownButtonState extends AddTimetableStates {}
class AddTimetableSectionDropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject1DropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject2DropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject3DropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject4DropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject5DropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject6DropDownButtonState extends AddTimetableStates {}
class AddTimetableSubject7DropDownButtonState extends AddTimetableStates {}
class AddTimetableDayDropDownButtonState extends AddTimetableStates {}



//classrooms



class ShowClassroomsTLoadingState extends AddTimetableStates{}
class ShowClassroomsTSuccessState extends AddTimetableStates{
  final ClassroomModel classroomModel;
  ShowClassroomsTSuccessState(this.classroomModel);
}
class ShowClassroomsTErrorState extends AddTimetableStates{
  final String error;
  ShowClassroomsTErrorState(this.error);
}



//subjects


class ShowSubjectsTLoadingState extends AddTimetableStates{}
class ShowSubjectsTSuccessState extends AddTimetableStates{
  final SubjectModel subjectModel;
  ShowSubjectsTSuccessState(this.subjectModel);
}
class ShowSubjectsTErrorState extends AddTimetableStates{
  final String error;
  ShowSubjectsTErrorState(this.error);
}