import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_notice_state.dart';

class ShowNoticeCubit extends Cubit<ShowNoticeState> {
  ShowNoticeCubit() : super(ShowNoticeInitial());
  static ShowNoticeCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection = '1';
  String? dropDownValueType = '1';
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
  List<DropdownMenuItem> menuItemsSection = [];
  List<DropdownMenuItem> menuItemsType = [
    DropdownMenuItem(
      value: '1',
      child: Text('T1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Mid'),
    ),
  ];
  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    emit(ClassDropDownButtonState());
  }

  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(SectionDropDownButtonState());
  }

  void changeTypeDropDownButton(String newValue) {
    dropDownValueType = newValue;
    print('drooooooo${dropDownValueType}');
    emit(ShowNoticeByType());
  }
  AddExamsModel? addExamsModel;
  List<dynamic>? students;
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
  //todo: في تكميلة هون
  // void getNotes()
  // {
  //   emit(ShowNoticeLoadingState());
  //   DioHelper.getData(
  //     url: '',
  //     token: token,
  //   ).then((value) {
  //     print(value?.data);
  //     showStudentsModel = ShowStudentsModel.fromJson(value?.data);
  //     print(showStudentsModel?.status);
  //     print(showStudentsModel?.message);
  //     print(showStudentsModel?.data?[0].address);
  //     students = showStudentsModel?.data;
  //     print(students?[1].religion);
  //     emit(ShowStudentsSuccessState(showStudentsModel!));
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(ShowStudentsErrorState(error.toString()));
  //   });
  // }


}
