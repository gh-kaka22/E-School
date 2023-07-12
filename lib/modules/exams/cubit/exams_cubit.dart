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
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNWUxNzZkYTI4ZWQzNWQ5ZmQwMDYxYzQ5MGY4ZDE1ZjI0OTBmMDAyNTYzNTUwNDRjMTkwMWFmMWQ5ODQ5MzJmMjQxYWFkYzg2OWUzYzM4YzciLCJpYXQiOjE2ODY5MTQ4MDguMjM1MjE4LCJuYmYiOjE2ODY5MTQ4MDguMjM1MjIzLCJleHAiOjE3MTg1MzcyMDguMjI4NDY2LCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.XOVgym3SBJzNj2dz790IYnjYZUqXjiL5pGKh6pQ8fJNojaCqNoBPR3Jn-KbEGq9wyFcx0mYFSx81x3ntMxbzXawqYnHLwkOOcoOayZddpN76CTqU0x9MS9riNgu8fSPOOgiUrgAHZ5UOpgKViYj5tXG4I5fXW9tZxmQmI6ZKxsLpegrUVILhaQRtTYvaHsF7klCOmxQf9nk0l2LLavfRAB2P60fsyEIzEDwEpyefMT6zBU2Pk9rKDEva7-08DWC9wmT94OD1njsgmT0BF14T1plJlDrAh90xDXsaM00d-MIE6iJDr_Ogy1NwLlSgGmLgd9OzO02cmhAsk1cG8jjphm2C2nrWfLQ1N6LcxplXfuFooSPrfJRnj_iyovWLg9OmkmjThxIJrMPnkSBEIcCPaPPgfqAsZfUDtqG1qDRKCSUQANXP8h03JyeyvYvUYtTrlssZGxusWTCKtaC9OwniSyKEmDdtmhIEfgtbQKsmDVHuyPD_1-l0YbInFOFznqEEjZruBLQJlmLZ9o8LUfLwQodWMYw1G8ccF9Eiz4k_SaB9KndFKdprw4p_3tUzrw4Vc0DE_MmjUfeK1PtjOts7tpFGVHCwBgVcbWPqc-6HmW-ZAS3_YzL8hAU_yBfM55JQzqRRfCoWalakd3ajpiw-NO-cSC_ORqSxFAPvKNbNfyo',
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