

import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/create_post_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class CreatePostStates {}

class CreatePostInitialState extends CreatePostStates {}
class CreatePostLoadingState extends CreatePostStates {}
class CreatePostSuccessState extends CreatePostStates {
  final CreatePostModel createPostModel;

  CreatePostSuccessState(this.createPostModel);
}
class CreatePostErrorState extends CreatePostStates{
  final String error;
  CreatePostErrorState(this.error);
}
class CreatePostChangeGradeDropDownButtonState extends CreatePostStates {}
class CheckBoxState extends CreatePostStates{}


//classrooms
class ShowClassroomsPLoadingState extends CreatePostStates{}
class ShowClassroomsPSuccessState extends CreatePostStates{
  final ClassroomModel classroomModel;
  ShowClassroomsPSuccessState(this.classroomModel);
}
class ShowClassroomsPErrorState extends CreatePostStates{
  final String error;
  ShowClassroomsPErrorState(this.error);
}
