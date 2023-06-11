import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/school_year_model.dart';
import 'package:untitled/modules/schoolYears/show/cubit/show_school_year_states.dart';
import 'package:untitled/modules/schoolYears/show/cubit/show_school_year_cubit.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowSchoolYearCubit extends Cubit<ShowSchoolYearStates> {
  ShowSchoolYearCubit() : super(ShowSchoolYearInitialState());

  static ShowSchoolYearCubit get(context) => BlocProvider.of(context);


  SchoolYearModel? schoolYearModel;

  List<dynamic>? schoolYears;

  void getSchoolYear()
  {
    emit(ShowSchoolYearLoadingState());
    DioHelper.getData(
      url: GETSCHOOLYEARS,
      token: token,
    ).then((value) {
      print(value?.data);
      schoolYearModel = SchoolYearModel.fromJson(value?.data);
      print(schoolYearModel?.status);
      print(schoolYearModel?.message);
      print(schoolYearModel?.data?[0].name);
      schoolYears = schoolYearModel?.data;
      print(schoolYears?[1].name);
      emit(ShowSchoolYearSuccessState(schoolYearModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSchoolYearErrorState(error.toString()));
    });
  }
}

