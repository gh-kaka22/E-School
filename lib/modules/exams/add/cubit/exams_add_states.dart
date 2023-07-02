import 'package:untitled/models/add_exams_entered_model.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/school_year_model.dart';
import 'package:untitled/models/subject_model.dart';


abstract class AddExamsStates {}

class AddExamsInitialState extends AddExamsStates {}
class AddExamsLoadingState extends AddExamsStates{}
class AddExamsEnteredLoadingState extends AddExamsStates{}
class AddExamsSuccessState extends AddExamsStates{
  final AddExamsModel showExamsModel;
  AddExamsSuccessState(this.showExamsModel);
}
class AddExamsEnteredSuccessState extends AddExamsStates{
  final AddExamsEnteredModel addExamsEnteredModel;
  AddExamsEnteredSuccessState(this.addExamsEnteredModel);
}

class AddExamsErrorState extends AddExamsStates{
  final String error;
  AddExamsErrorState(this.error);
}
//dropdowns
class AddExamsClassDropDownButtonState extends AddExamsStates{}
class AddExamsSectionDropDownButtonState extends AddExamsStates{}
class AddExamsSubjectDropDownButtonState extends AddExamsStates{}
class AddExamsTypeDropDownButtonState extends AddExamsStates{}
class AddExamsYearDropDownButtonState extends AddExamsStates{}



//classrooms



class ShowClassroomsXLoadingState extends AddExamsStates{}
class ShowClassroomsXSuccessState extends AddExamsStates{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends AddExamsStates{
  final String error;
  ShowClassroomsXErrorState(this.error);
}



//subjects


class ShowSubjectsXLoadingState extends AddExamsStates{}
class ShowSubjectsXSuccessState extends AddExamsStates{
  final SubjectModel subjectModel;
  ShowSubjectsXSuccessState(this.subjectModel);
}
class ShowSubjectsXErrorState extends AddExamsStates{
  final String error;
  ShowSubjectsXErrorState(this.error);
}


//schoolyears

class ShowSchoolYearXLoadingState extends AddExamsStates{}
class ShowSchoolYearXSuccessState extends AddExamsStates{
  final SchoolYearModel schoolYearModel;
  ShowSchoolYearXSuccessState(this.schoolYearModel);
}

class ShowSchoolYearXErrorState extends AddExamsStates{
  final String error;
  ShowSchoolYearXErrorState(this.error);
}

//date
class DateState extends AddExamsStates{}