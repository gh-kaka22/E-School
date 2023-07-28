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
  ShowExamScheduleModel? showExamScheduleModel;
  List<dynamic>? schedules;

  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ExamsClassDropDownButtonState());
  }

   void getExamScheduleByGrade(value)
  {
    emit(ShowExamScheduleLoadingState());
    DioHelper.getData(
      url: '${GETEXAMSCHEDULEBYGRADE}/${dropDownValueClass}',
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
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTgxMzJkNjMyZjU0ZmVjYjUxNjIxNDUzMWYwZGI1N2Y0ODE4OTRkZTc5NWJkMmEwOWQ4OGZhMzc3MzEzOGMyZjMxOWI3MjRlZWQxNTEwODciLCJpYXQiOjE2OTA1MzAwNjguNDYzNDA5LCJuYmYiOjE2OTA1MzAwNjguNDYzNDI2LCJleHAiOjE3MjIxNTI0NjcuNTE2NDU1LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.McQuTiU5YVnYUzxHjMAMyHjGbyEeMVbrSw9M9ywe4ELOwJZQtd9_W1qR0lor7KSMWtVce_G7btSxi-grA62ZwsqLuJdREwkNy7kPvtlUTN9GSXanMvpBCdG7BXcGo-LZjjHPKGyz3ZyLDjGc5GPSjfr50tBQkPnVmSuy0qXjyCHWncmYk-JhKTUwcpVoopTKk1b3QyBLqBWwdbq_dqPxdMCq3zBsGeirVQTyB81ghxY6VEoDcHeWfe_NgnXNZRrRXS5twYun_tZc8W8exCb0NIoFGuB56BsenfbpJBJ8hnftIala8bw6HuXL2xND1eXiApvHIP9g8RQqsd6awe-xk_7uOjRPxocNhtSn0DLyaTPIjcW06fkXDhGc90tsgOuS02FmRTiHBT8abDgrn37JhN1AkQ1cudRD7ngn8YAf6RIpdyP4MWPjEIIhJhT0oVgPDYNRJ3V54km9Fccrlt6VxBUEi3zvciOvSsBIo5Okgu1kmtQH0sm852jdfFEwXipGZMgBBzuolCBHXbnDatqbGvECpZVWOOrwpv0scdq3MLKzN-NiL-LNrUAI8kR7EnWnHFWv_seKgvHudsn5ztmOKH2idLeMzg18z_naLWK1apl0COSBvbm6Z8Al5-8KQAHnnzyQMMGfkcbF0fb6Q7MeVt37NEmWF2Kto2AxsnEgioU',
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
