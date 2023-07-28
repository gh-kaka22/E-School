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
  List<DropdownMenuItem> menuItemsDay = [
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
      url: '${SHOWTIMETABLETEACHER}/${dropDownValueDay}',
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGNmMDgxNzY1NGQ4Y2FhZDhjYjFjN2UwNDk2MjljYjcxZWZjMzg3MDA3YTQxZWJjODU5MjUzNzU0MWM1NGM2NmJjM2M2NDc4NzQ4OGQwZjAiLCJpYXQiOjE2ODk5MzI1MTMuMjgzMzI4LCJuYmYiOjE2ODk5MzI1MTMuMjgzMzQxLCJleHAiOjE3MjE1NTQ5MTMuMjU5NjkxLCJzdWIiOiIxMCIsInNjb3BlcyI6W119.ILX9sOvmQjVPOIT_9P-G9f_d7xct9eOnsglgP7uAM2ZbAE1JJYvBCW-cepv-V6cKJ88_axCbbuKjSQxnCEl5E7OEcUSLcXBqDh7w3VuvHv0PvV-ZlCtYW1FPv0g8i_YzANwX7EbScH8S8CHi0f4L1NmHkVG-T31goN8ogfmIbFLiXVH1_7S-GWngkW1SSmEbbyHtMQx5kLUBob7DRXMkp7ITTJtIaS0FuZ4P8KjU0utlmTalFA9UYFD7d4BJPkvtJ7B_x-5sc9ukujkSbwWgEo6tloswOETGtW3f5F5rM4XHZRKMWHDDczCC4Ro1i1yieDuAE_uF26YU2y9XfDMX9U0K_jz6Rl8gJ07W25V5Tw7wm0iFISJAWi0ohDF9jB3jrfN7naFOPLsRK9Y6Ts94pTXcQKdasd0hXHKdvMcqgtn03QYLCeURBEbMDImr1yOlv-fdvqb9OrSlqEBw096aOsWbE8yIrDsuBltzVNnxDoh4wpgqU1jpWW6Q4MfUSSIGcI7Lo-LIFULlGuEecWM4jqTgMzhFT6vRIK_27rdNHJu8_5EIeh0M0PgQ2N04O5jr_doOc20nURg7ihd5u8Ro1alTm9w_umAVQjghiWMhCft4-UgBV3LdqSdoZ-f9oa3cS6EkL0nwNOzvpJH1m7Pg75FxriFoaSAWBCvOGaRJG9g',
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
