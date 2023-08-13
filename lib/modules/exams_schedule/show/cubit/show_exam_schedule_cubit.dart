import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/show_exam_schedule.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_exam_schedule_state.dart';

class ShowExamScheduleCubit extends Cubit<ShowExamScheduleState> {
  ShowExamScheduleCubit() : super(ShowExamScheduleInitial());
  static ShowExamScheduleCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass='7';
  List<DropdownMenuItem> menuItemsClass = [
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
  ShowExamScheduleModel? showExamScheduleModel;
  List<dynamic>? schedules;
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ExamsClassDropDownButtonState());
  }

   getExamScheduleByGrade(value)
  {
    emit(ShowExamScheduleLoadingState());
    DioHelper.getData(
      url: '${GETEXAMSCHEDULEBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      showExamScheduleModel = ShowExamScheduleModel.fromJson(value?.data);
      print(showExamScheduleModel?.status);
      print(showExamScheduleModel?.message);
      print(showExamScheduleModel?.data?[0].gradeId);
      schedules = showExamScheduleModel?.data;
      emit(ShowExamScheduleSuccessState(showExamScheduleModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamScheduleErrorState(error.toString()));
    });
  }


  void getExamSchedule()
  {
    emit(ShowExamScheduleLoadingState());
    DioHelper.getData(
      url: GETEXAMSCHEDULE,
      token: token,
    ).then((value) {
      print(value?.data);
      showExamScheduleModel = ShowExamScheduleModel.fromJson(value?.data);
      print(showExamScheduleModel?.status);
      print(showExamScheduleModel?.message);
      print(showExamScheduleModel?.data?[0].gradeId);
      schedules = showExamScheduleModel?.data;
      emit(ShowExamScheduleSuccessState(showExamScheduleModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamScheduleErrorState(error.toString()));
    });
  }
}
