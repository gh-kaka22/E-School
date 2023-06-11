

import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class AddSubjectStates {}

class AddSubjectInitialState extends AddSubjectStates {}
class AddSubjectLoadingState extends AddSubjectStates {}
class AddSubjectSuccessState extends AddSubjectStates {
  final AddSubjectModel addSubjectModel;

  AddSubjectSuccessState(this.addSubjectModel);
}
class AddSubjectErrorState extends AddSubjectStates{
  final String error;
  AddSubjectErrorState(this.error);
}
