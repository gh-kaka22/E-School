

import 'package:untitled/models/add_school_year_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}
class ResetPasswordLoadingState extends ResetPasswordStates {}
class ResetPasswordSuccessState extends ResetPasswordStates {

}
class ResetPasswordErrorState extends ResetPasswordStates{
  final String error;
  ResetPasswordErrorState(this.error);
}
