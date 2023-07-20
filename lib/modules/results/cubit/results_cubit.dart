import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/calc_model.dart';
import 'package:untitled/models/ranking_model.dart';
import 'package:untitled/models/upgrade_model.dart';
import 'package:untitled/modules/results/cubit/results_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ResultsCubit extends Cubit<ResultsStates> {
  ResultsCubit() : super(ResultsInitialState());

  static ResultsCubit get(context) => BlocProvider.of(context);

  ///DropDowns
  String? dropDownValueClass;
  String? dropDownValueSchoolYear;

  List<DropdownMenuItem> menuClassItems = [
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
  List<DropdownMenuItem> menuYearItems=  [
    DropdownMenuItem(
      value: '2022/2023',
      child: Text('2022/2023'),
    ),
    DropdownMenuItem(
      value: '2023/2024',
      child: Text('2023/2024'),
    ),
    DropdownMenuItem(
      value: '2024/2025',
      child: Text('2024/2025'),
    ),
  ];

  // drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ResultsClassDropDownButtonState());
  }
  void changeSchoolYearDropDownButton(String newValue)
  {
    dropDownValueSchoolYear = newValue;
    emit(ResultsYearDropDownButtonState());
  }


  ///Calculate
  CalcModel? calcModel;
  List<dynamic>? calcR;
  void calc(
      {
        required gradeId,
        required schoolYear,
      })
  {
    emit(ResultsCalcLoadingState());
    DioHelper.postData(
        url: CALCULATE,
        token: token,
        data: {
          'grade_id':gradeId,
          'schoolyear':schoolYear,
        }).then((value) {
      print(value?.data);
      calcModel = CalcModel.fromJson(value?.data);
      print(calcModel?.status);
      print(calcModel?.message);
      print(calcModel?.data);
      calcR = calcModel?.data;
      emit(ResultsCalcSuccessState(calcModel!));
    }).catchError((error){
      print(error.toString());
      emit(ResultsCalcErrorState(error.toString()));
    });

  }

  ///Upgrade
  UpgradeModel? upgradeModel;
  List<dynamic>? upgradeR;
  void upgrade(
      {
        required gradeId,
        required schoolYear,
      })
  {
    emit(ResultsUpgradeLoadingState());
    DioHelper.postData(
        url: UPGRADE,
        token: token,
        data: {
          'grade_id':gradeId,
          'schoolyear':schoolYear,
        }).then((value) {
      print(value?.data);
      upgradeModel = UpgradeModel.fromJson(value?.data);
      print(upgradeModel?.status);
      print(upgradeModel?.message);
      print(upgradeModel?.data);
      upgradeR = upgradeModel?.data;
      emit(ResultsUpgradeSuccessState(upgradeModel!));
    }).catchError((error){
      print(error.toString());
      emit(ResultsUpgradeErrorState(error.toString()));
    });

  }


  ///Ranking
  RankingModel? rankingModel;
  List<dynamic>? studentsR;
  void getStudentsRanking(
      {
        required gradeId,
        required schoolYear,
      }
      )
  {
    emit(ResultsLoadingState());
    DioHelper.postData(
        url: RANKING,
        token: token,
        data: {
          'grade_id':gradeId,
          'schoolyear':schoolYear,
        }).then((value) {
      print(value?.data);
      rankingModel = RankingModel.fromJson(value?.data);
      print(rankingModel?.status);
      print(rankingModel?.message);
      print(rankingModel?.data);
      studentsR = rankingModel?.data;
      emit(ResultsSuccessState(rankingModel!));
    }).catchError((error){
      print(error.toString());
      emit(ResultsErrorState(error.toString()));
    });
  }




}

