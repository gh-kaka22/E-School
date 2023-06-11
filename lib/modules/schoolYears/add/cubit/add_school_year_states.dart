

import 'package:untitled/models/add_school_year_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class AddSchoolYearStates {}

class AddSchoolYearInitialState extends AddSchoolYearStates {}
class AddSchoolYearLoadingState extends AddSchoolYearStates {}
class AddSchoolYearSuccessState extends AddSchoolYearStates {
  final AddSchoolYearModel addSchoolYearModel;

  AddSchoolYearSuccessState(this.addSchoolYearModel);
}
class AddSchoolYearErrorState extends AddSchoolYearStates{
  final String error;
  AddSchoolYearErrorState(this.error);
}
