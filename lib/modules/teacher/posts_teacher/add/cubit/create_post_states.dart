

import 'package:e_school/models/classroom_model.dart';
import 'package:e_school/models/create_post_model.dart';
import 'package:e_school/models/teacher_home_model.dart';


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
  final TeacherHomeModel teacherHomeModel;
  ShowClassroomsPSuccessState(this.teacherHomeModel);
}
class ShowClassroomsPErrorState extends CreatePostStates{
  final String error;
  ShowClassroomsPErrorState(this.error);
}
