

import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class AddClassroomStates {}

class AddClassroomInitialState extends AddClassroomStates {}
class AddClassroomLoadingState extends AddClassroomStates {}
class AddClassroomSuccessState extends AddClassroomStates {
  final AddClassroomModel addClassroomModel;

  AddClassroomSuccessState(this.addClassroomModel);
}
class AddClassroomErrorState extends AddClassroomStates{
  final String error;
  AddClassroomErrorState(this.error);
}
class AddClassroomChangeGradeDropDownButtonState extends AddClassroomStates {}
