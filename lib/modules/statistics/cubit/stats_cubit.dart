

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/stats_model.dart';
import 'package:untitled/modules/statistics/cubit/stats_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class StatsCubit extends Cubit<StatsStates> {
  StatsCubit() : super(StatsInitialState());
  static StatsCubit get(context) => BlocProvider.of(context);

  int? teachers;
  int? students;
  int? employees;
  int? admins;

  ///Bringing Stats

  StatsModel? statsModel;
  void getStats()
  {
    emit(StatsLoadingState());
    DioHelper.getData(
      url: STATS,
      token: token,
    ).then((value) {
      print(value?.data);
      statsModel = StatsModel.fromJson(value?.data);
      print(statsModel?.status);
      print(statsModel?.message);
      print(statsModel?.data.teachers);
      teachers=statsModel?.data.teachers;
      students=statsModel?.data.students;
      employees=statsModel?.data.employees;
      admins=statsModel?.data.admins;
      emit(StatsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(StatsErrorState(error.toString()));
    });
  }

  ///Making Chart
  List<ChartData> chart=[];
  void getDataC(){
      chart =[
      ChartData(students??0,'Students',Colors.blue),
      ChartData(teachers??0,'Teachers',Colors.redAccent),
      ChartData(employees??0,'Employees',Colors.green),
      ChartData(admins??0,'Admins',Colors.yellow),
    ];

  }


}
class ChartData{
  ChartData(this.number,this.user,this.color);
  final String user;
  final int number;
  final Color color;
}