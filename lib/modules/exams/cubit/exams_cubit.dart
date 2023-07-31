import 'package:e_school/models/exam_model.dart';
import 'package:e_school/modules/exams/cubit/exams_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsCubit extends Cubit<ExamsStates> {
  ExamsCubit() : super(ExamsInitialState());

  static ExamsCubit get(context) => BlocProvider.of(context);

  String? dropDownValueType='1';
  String? dropDownValueYear='2022/2023';
  List<DropdownMenuItem> menuItemsType = [
    DropdownMenuItem(
      value: '1',
      child: Text('Exams T1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Mid'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('Exams T2'),
    ),
    DropdownMenuItem(
      value: '4',
      child: Text('Final'),
    ),

  ];
  List<DropdownMenuItem> menuItemsYear = [
    DropdownMenuItem(
      value: '2022/2023',
      child: Text('2022/2023'),
    ),
    DropdownMenuItem(
      value: '2023/2024',
      child: Text('2023/2024'),
    ),
  ];
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(ExamsTypeDropDownButtonState());
  }
  void changeYearDropDownButton(String newValue)
  {
    dropDownValueYear = newValue;
    emit(ExamsYearDropDownButtonState());
  }


  ExamsModel? examsModel;
  List<dynamic>? subjects;
  void getStudentMarks(type,year)
  {
    emit(ExamsLoadingState());
    DioHelper.postData(
      url: EXAMS,
      data:{
        'type_id':type,
        'schoolyear':year,
      },
      token: token
    ).then((value) {
      print(value?.data);
      examsModel = ExamsModel.fromJson(value?.data);
      print(examsModel?.status);
      print(examsModel?.message);
      print(examsModel?.data[0].name);
      subjects = examsModel?.data;
      print(subjects?[0].mark);
      emit(ExamsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ExamsErrorState(error.toString()));
    });
  }





}