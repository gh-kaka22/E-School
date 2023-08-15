import 'package:bloc/bloc.dart';
import 'package:e_school/models/exam_schedule_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'exam_schedule_state.dart';

class ExamScheduleCubit extends Cubit<ExamScheduleState> {
  ExamScheduleCubit() : super(ExamScheduleInitial());
  static ExamScheduleCubit get(context) => BlocProvider.of(context);
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
  ExamScheduleModel? examScheduleModel;
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ExamsClassDropDownButtonState());
  }
String? image;
  void getExamSchedule()
  {
    emit(ShowExamScheduleLoadingState());
    DioHelper.getData(
      url: GETEXAMSCHEDULE,
      token: token
    ).then((value) {
      print(value?.data);
      examScheduleModel = ExamScheduleModel.fromJson(value?.data);
      print(examScheduleModel?.status);
      print(examScheduleModel?.message);
      print(examScheduleModel?.data.gradeId);
      image=examScheduleModel?.data.image;
      emit(ShowExamScheduleSuccessState(examScheduleModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamScheduleErrorState(error.toString()));
    });
  }

}
