
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/school_year_model.dart';
import 'package:untitled/models/show_exams_model.dart';
import 'package:untitled/models/subject_model.dart';


abstract class ShowExamsStates {}

class ShowExamsInitialState extends ShowExamsStates {}
class ShowExamsLoadingState extends ShowExamsStates{}
class ShowExamsSuccessState extends ShowExamsStates{
  final ShowExamsModel showExamsModel;
  ShowExamsSuccessState(this.showExamsModel);
}
class ShowExamsErrorState extends ShowExamsStates{
  final String error;
  ShowExamsErrorState(this.error);
}
//dropdowns
class ShowExamsClassDropDownButtonState extends ShowExamsStates{}
class ShowExamsSectionDropDownButtonState extends ShowExamsStates{}
class ShowExamsSubjectDropDownButtonState extends ShowExamsStates{}
class ShowExamsTypeDropDownButtonState extends ShowExamsStates{}
class ShowExamsYearDropDownButtonState extends ShowExamsStates{}



//classrooms



class ShowClassroomsXLoadingState extends ShowExamsStates{}
class ShowClassroomsXSuccessState extends ShowExamsStates{
  final ClassroomModel classroomModel;
  ShowClassroomsXSuccessState(this.classroomModel);
}
class ShowClassroomsXErrorState extends ShowExamsStates{
  final String error;
  ShowClassroomsXErrorState(this.error);
}



//subjects


class ShowSubjectsXLoadingState extends ShowExamsStates{}
class ShowSubjectsXSuccessState extends ShowExamsStates{
  final SubjectModel subjectModel;
  ShowSubjectsXSuccessState(this.subjectModel);
}
class ShowSubjectsXErrorState extends ShowExamsStates{
  final String error;
  ShowSubjectsXErrorState(this.error);
}


//schoolyears

class ShowSchoolYearXLoadingState extends ShowExamsStates{}
class ShowSchoolYearXSuccessState extends ShowExamsStates{
  final SchoolYearModel schoolYearModel;
  ShowSchoolYearXSuccessState(this.schoolYearModel);
}

class ShowSchoolYearXErrorState extends ShowExamsStates{
  final String error;
  ShowSchoolYearXErrorState(this.error);
}
