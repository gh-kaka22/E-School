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
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGQ3YWY0YjNmODBjMTk5ZjFlZWY5NTdkMGE3ZjFhZWY2YWFlMGNlNDFkODMxZDJmMzkwN2U3NjZmZDVmNzgwNmI3MzU5NGE1ZmY3YWE5NGEiLCJpYXQiOjE2OTA4MjAyMTMuMDYwOTI3LCJuYmYiOjE2OTA4MjAyMTMuMDYwOTMzLCJleHAiOjE3MjI0NDI2MTMuMDQ4MzI4LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.CGX8FLoC-okDx3l61JNXvkjYsFpRcjTLFZec10Xp7zW2Kp5KrXrMGAKJ5bv6cvq5rvCWnyGPSpoVypwVCiNBDQju5CzhlVk5R83saNhsu9RMHlpNTfbSwLv6CNW96PF7ue5N9WSeN5J6_MD_N0IlfB71GTTTLYqfawUmfTNWcC34JYVaPgoHrF_iwLnChy5LmdqF4TuMP2XR0ou0axzmJ33PjrrjY4LOmDfpCbGaQoIdXx673t4gOkCwG9yZ8Hqt2fH800N03V5C2lwfbOseUbjxFnevyWkq5_IK0v5blcodVm_X_t-alAm0wycB0T8k9SzBKZOr6O7UxB27-FqWpEIZSsRWe3bkptK7pCY6EcFVcZ7J3Y8Riza7-uYutwdhEHgVv8obxjgnL8FsGIjtRsxXNftl5gZ6E_p2DAha-MBjaF0II5sS8kN-YU2i61vgZDuYXXU8mi0TLnJvc29f9iZq6roHARSaBZtoGMJ64EoHjwOawV0rWP2ISKkUm3GbRrrmRqkzESOBGRWg56jGhWhGyYk8FvaWjhjItd86hVMuxDceWu1xlzht1UH3JgI0Ag6VkJjgdX-5-OHri1Gk4goOGy1EE8cNdKP0sXxoQSBgPGDmuIfUNq-njFeMP3qe4YUHm4VROb7WPVF5XdkmfXm9qTh1XUt73tKPVKlu9vY',
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
