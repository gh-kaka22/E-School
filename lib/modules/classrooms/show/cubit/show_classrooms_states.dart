import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/clearclassroom.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/subject_model.dart';

abstract class ShowClassroomsStates {}

class ShowClassroomsInitialState extends ShowClassroomsStates {}
class ShowClassroomsLoadingState extends ShowClassroomsStates{}
class ShowClassroomsSuccessState extends ShowClassroomsStates{
   final ClassroomModel classroomModel;
   ShowClassroomsSuccessState(this.classroomModel);
}
class ShowClassroomsErrorState extends ShowClassroomsStates{
  final String error;
  ShowClassroomsErrorState(this.error);
}



class ClearClassroomsLoadingState extends ShowClassroomsStates{}
class ClearClassroomsSuccessState extends ShowClassroomsStates{
  ClearClassroom clearClassroom;
  ClearClassroomsSuccessState(this.clearClassroom);
}
class ClearClassroomsErrorState extends ShowClassroomsStates{
  final String error;
  ClearClassroomsErrorState(this.error);
}

