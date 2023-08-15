import 'package:bloc/bloc.dart';
import 'package:e_school/models/exam_schedule_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'exam_schedule_state.dart';

class ExamScheduleParentCubit extends Cubit<ExamScheduleParentState> {
  ExamScheduleParentCubit() : super(ExamScheduleParentInitial());
  static ExamScheduleParentCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass;
  List<DropdownMenuItem<String>> menuItemsClass = [
    DropdownMenuItem(
      value: '7',
      child: Text('7'),
    ),
    DropdownMenuItem(
      value: '8',
      child: Text('8'),
    ),
    DropdownMenuItem(
      value: '9',
      child: Text('9'),
    ),
  ];
  ExamScheduleModel? showExamScheduleModel;
  List<dynamic>? schedules;

  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ExamsClassDropDownButtonState());
  }


  void getExamScheduleParent()
  {
    emit(ShowExamScheduleParentLoadingState());
    DioHelper.getData(
      url: GETEXAMSCHEDULE,
      token: token
    ).then((value) {
      print(value?.data);
      showExamScheduleModel = ExamScheduleModel.fromJson(value?.data);
      print(showExamScheduleModel?.status);
      print(showExamScheduleModel?.message);
      // print(showExamScheduleModel?.data?[0].gradeId);
      // schedules = showExamScheduleModel?.data;
      emit(ShowExamScheduleParentSuccessState(showExamScheduleModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamScheduleParentErrorState(error.toString()));
    });
  }

}
