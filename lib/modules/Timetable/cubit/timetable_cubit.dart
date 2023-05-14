import 'package:e_school/modules/Timetable/cubit/timetable_states.dart';
import 'package:e_school/modules/exams/cubit/exams_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TimetableCubit extends Cubit<TimetableStates> {
  TimetableCubit() : super(TimetableInitialState());

  static TimetableCubit get(context) => BlocProvider.of(context);

  List<String> days = [
    "SUN",
    "MON",
    "TUE",
    "WED",
    "THU",
  ];

  int currentIndex=0;
  void changeTimeTableTabBar(int index)
  {
    currentIndex= index;
    emit(TimeTableChangeTabBarState());
  }




}