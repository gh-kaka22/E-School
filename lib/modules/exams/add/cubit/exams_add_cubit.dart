import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/add_exams_model.dart';


import 'package:untitled/modules/exams/add/cubit/exams_add_states.dart';

import 'package:untitled/shared/components/constants.dart';

import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddExamsCubit extends Cubit<AddExamsStates> {
  AddExamsCubit() : super(AddExamsInitialState());

  static AddExamsCubit get(context) => BlocProvider.of(context);

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
    emit(AddExamsClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(AddExamsSectionDropDownButtonState());
  }
  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
    emit(AddExamsSubjectDropDownButtonState());
  }
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(AddExamsTypeDropDownButtonState());
  }

  List<TextEditingController> controllers = [];

  AddExamsModel? addExamsModel;

  List<dynamic>? students;

  void getStudents()
  {
    emit(AddExamsLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      addExamsModel = AddExamsModel.fromJson(value?.data);
      print(addExamsModel?.status);
      print(addExamsModel?.message);
      print(addExamsModel?.data?[0].email);
      students = addExamsModel?.data;
      print(students?[1].religion);
      emit(AddExamsSuccessState(addExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(AddExamsErrorState(error.toString()));
    });
  }

  void getExamsByGrade(value)
  {
    emit(AddExamsLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      addExamsModel = AddExamsModel.fromJson(value?.data);
      print(addExamsModel?.status);
      print(addExamsModel?.message);
      print(addExamsModel?.data?[0].email);
      students = addExamsModel?.data;
      print(students?[1].religion);
      emit(AddExamsSuccessState(addExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(AddExamsErrorState(error.toString()));
    });
  }






}

