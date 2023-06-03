import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/show_exams_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowExamsCubit extends Cubit<ShowExamsStates> {
  ShowExamsCubit() : super(ShowExamsInitialState());

  static ShowExamsCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection = 'A';
  String? dropDownValueSubject = 'Math';
  String? dropDownValueType = 'Mid';

  List<DropdownMenuItem> menuItemsClass = [
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
  List<DropdownMenuItem> menuItemsSection = [
    DropdownMenuItem(
      value: 'A',
      child: Text('A'),
    ),
    DropdownMenuItem(
      value: 'B',
      child: Text('B'),
    ),
    DropdownMenuItem(
      value: 'C',
      child: Text('C'),
    ),
  ];
  List<DropdownMenuItem> menuItemsSubject = [
    DropdownMenuItem(
      value: 'Math',
      child: Text('Math'),
    ),
    DropdownMenuItem(
      value: 'Science',
      child: Text('Science'),
    ),
  ];
  List<DropdownMenuItem> menuItemsType = [
    DropdownMenuItem(
      value: 'T1',
      child: Text('T1'),
    ),
    DropdownMenuItem(
      value: 'Mid',
      child: Text('Mid'),
    ),
    DropdownMenuItem(
      value: 'T2',
      child: Text('T2'),
    ),
    DropdownMenuItem(
      value: 'Final',
      child: Text('Final'),
    ),
  ];


  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ShowExamsClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(ShowExamsSectionDropDownButtonState());
  }
  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
    emit(ShowExamsSubjectDropDownButtonState());
  }
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(ShowExamsTypeDropDownButtonState());
  }

  ShowExamsModel? showExamsModel;

  List<dynamic>? students;

  void getStudents()
  {
    emit(ShowExamsLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      showExamsModel = ShowExamsModel.fromJson(value?.data);
      print(showExamsModel?.status);
      print(showExamsModel?.message);
      print(showExamsModel?.data?[0].email);
      students = showExamsModel?.data;
      print(students?[1].religion);
      emit(ShowExamsSuccessState(showExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamsErrorState(error.toString()));
    });
  }

  void getExamsByGrade(value)
  {
    emit(ShowExamsLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      showExamsModel = ShowExamsModel.fromJson(value?.data);
      print(showExamsModel?.status);
      print(showExamsModel?.message);
      print(showExamsModel?.data?[0].email);
      students = showExamsModel?.data;
      print(students?[1].religion);
      emit(ShowExamsSuccessState(showExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamsErrorState(error.toString()));
    });
  }






}

