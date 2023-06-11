import 'package:untitled/models/school_year_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class ShowSchoolYearStates {}

class ShowSchoolYearInitialState extends ShowSchoolYearStates {}
class ShowSchoolYearLoadingState extends ShowSchoolYearStates{}
class ShowSchoolYearSuccessState extends ShowSchoolYearStates{
   final SchoolYearModel schoolYearModel;
   ShowSchoolYearSuccessState(this.schoolYearModel);
}

class ShowSchoolYearErrorState extends ShowSchoolYearStates{
  final String error;
  ShowSchoolYearErrorState(this.error);
}

