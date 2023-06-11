import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class ShowSubjectsStates {}

class ShowSubjectsInitialState extends ShowSubjectsStates {}
class ShowSubjectsLoadingState extends ShowSubjectsStates{}
class ShowSubjectsSuccessState extends ShowSubjectsStates{
   final SubjectModel subjectModel;
   ShowSubjectsSuccessState(this.subjectModel);
}

class ShowSubjectsErrorState extends ShowSubjectsStates{
  final String error;
  ShowSubjectsErrorState(this.error);
}

