import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/show_notes_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_notice_state.dart';

class ShowNoticeCubit extends Cubit<ShowNoticeState> {
  ShowNoticeCubit() : super(ShowNoticeInitial());
  static ShowNoticeCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection = '1';
 // String? dropDownValueType = '1';
  ShowNotesModel? showNotesModel;
  List<DropdownMenuItem> menuItems = [
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
  List<DropdownMenuItem> menuItems2= [];


  // List<DropdownMenuItem> menuItemsType = [
  //   DropdownMenuItem(
  //     value: '1',
  //     child: Text('T1'),
  //   ),
  //   DropdownMenuItem(
  //     value: '2',
  //     child: Text('Mid'),
  //   ),
  // ];
  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    emit(ClassDropDownButtonState());
  }

  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(SectionDropDownButtonState());
  }

  // void changeTypeDropDownButton(String newValue) {
  //   dropDownValueType = newValue;
  //   print('drooooooo${dropDownValueType}');
  //   emit(ShowNoticeByType());
  // }
  AddExamsModel? addExamsModel;
  List<dynamic>? students;
  List<dynamic>? notes;
  void getStudents() {
    emit(ShowNoticeLoadingState());
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
      emit(ShowExamSuccessState(addExamsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowNoticeErrorState(error.toString()));
    });
  }
  void getStudentsByGrade(value)
  {
    emit(ShowExamLoadingState());
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
      emit(ShowExamSuccessState(addExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamErrorState(error.toString()));
    });
  }

  void getNotes()
  {
    emit(ShowNoticeLoadingState());
    DioHelper.getData(
      url: SHOWNOTES,
      token: token,
    ).then((value) {
      print(value?.data);
      showNotesModel = ShowNotesModel.fromJson(value?.data);
      print(showNotesModel?.status);
      print(showNotesModel?.message);
      print(showNotesModel?.data?[0].content);
      notes = showNotesModel?.data;
      print(students?[1].religion);
      emit(ShowNoticeSuccessState(showNotesModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowNoticeErrorState(error.toString()));
    });
  }


}
