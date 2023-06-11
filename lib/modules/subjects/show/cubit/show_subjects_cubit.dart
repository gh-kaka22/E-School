import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/subject_model.dart';

import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowSubjectsCubit extends Cubit<ShowSubjectsStates> {
  ShowSubjectsCubit() : super(ShowSubjectsInitialState());

  static ShowSubjectsCubit get(context) => BlocProvider.of(context);


  SubjectModel? subjectModel;

  List<dynamic>? subjects;

  void getSubjects()
  {
    emit(ShowSubjectsLoadingState());
    DioHelper.getData(
      url: GETSUBJECTS,
      token: token,
    ).then((value) {
      print(value?.data);
      subjectModel = SubjectModel.fromJson(value?.data);
      print(subjectModel?.status);
      print(subjectModel?.message);
      print(subjectModel?.data?[0].name);
      subjects = subjectModel?.data;
      print(subjects?[1].max_mark);
      emit(ShowSubjectsSuccessState(subjectModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSubjectsErrorState(error.toString()));
    });
  }
}

