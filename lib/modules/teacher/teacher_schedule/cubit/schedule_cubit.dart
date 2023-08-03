import 'package:bloc/bloc.dart';
import 'package:e_school/models/teacher_schedule_model.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../../shared/components/constants.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());
  static ScheduleCubit get(context) => BlocProvider.of(context);
  TeachercShedule? teachercShedule;
  String? dropDownValueDay;
  int? dayID;
  List<DropdownMenuItem<String>> menuItemsDay = [
    DropdownMenuItem(
      value: '1',
      child: Text('Sunday'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Monday'),

    ),

    DropdownMenuItem(
      value: '3',
      child: Text('Tuesday'),
    ),
    DropdownMenuItem(
      value: '4',
      child: Text('Wednesday'),
    ),
    DropdownMenuItem(
      value: '5',
      child: Text('Thursday'),
    ),
  ];
  void changeDayDropDownButton(String newValue)
  {
    dropDownValueDay = newValue;
    emit(changDayState());
  }

  void getSchedule(dayId)
  {
    emit(ScheduleLoading());
    DioHelper.getData(
      url: '${SHOWTIMETABLETEACHER}/${dayId}',
      token: token,
    ).then((value) {
      teachercShedule = TeachercShedule.fromJson(value!.data);
      print(teachercShedule!.data!.fifthPeriod);
      print(teachercShedule!.data!.thirdPeriod);
      emit(ScheduleSuccessState(teachercShedule!));

    }
    ).catchError((error){
      print(error.toString());
      emit(ScheduleErrorState(error.toString()));
    });

  }
}
