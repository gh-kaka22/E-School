import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/clearclassroom.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_states.dart';

import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowClassroomsCubit extends Cubit<ShowClassroomsStates> {
  ShowClassroomsCubit() : super(ShowClassroomsInitialState());

  static ShowClassroomsCubit get(context) => BlocProvider.of(context);

  ClassroomModel? classroomModel;

  List<dynamic>? classrooms;
  List<dynamic>? clear;

  void getClassrooms()
  {
    emit(ShowClassroomsLoadingState());
    DioHelper.getData(
      url: GETCLASSROOMS,
      token: token,
    ).then((value) {
      print(value?.data);
      classroomModel = ClassroomModel.fromJson(value?.data);
      print(classroomModel?.status);
      print(classroomModel?.message);
      print(classroomModel?.data?[0].capacity);
      classrooms = classroomModel?.data;
      print(classrooms?[1].capacity);
      emit(ShowClassroomsSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsErrorState(error.toString()));
    });
  }
  ClearClassroom? clearClassroom;

  void clearClassrooms()
  {
    emit(ClearClassroomsLoadingState());
    DioHelper.getData(
      url: CLEARCLASSROOM,
      token: token,
    ).then((value) {
      print(value?.data);
      clearClassroom = ClearClassroom.fromJson(value?.data);
      clear = clearClassroom?.data;
      print(classrooms?[1].capacity);
      emit(ClearClassroomsSuccessState(clearClassroom!));
    }).catchError((error){
      print(error.toString());
      emit(ClearClassroomsErrorState(error.toString()));
    });
  }


}

