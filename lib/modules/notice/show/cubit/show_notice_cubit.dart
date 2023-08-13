import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_notes_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_notice_state.dart';

class ShowNoticeCubit extends Cubit<ShowNoticeState> {
  ShowNoticeCubit() : super(ShowNoticeInitial());
  static ShowNoticeCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection ;
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

  ShowStudentsModel? showStudentsModel;
  List<dynamic>? students;
  List<dynamic>? notes;
  void getStudents() {
    emit(ShowStudentLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0].email);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }
  void getStudentsByGrade(value)
  {
    emit(ShowStudentLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0].email);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }
  ///getClassrooms
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsNLoadingState());
    DioHelper.getData(
      url: '${GETCLASSROOMSOFAGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      classroomModel = ClassroomModel.fromJson(value?.data);
      print(classroomModel?.status);
      print(classroomModel?.message);
      print(classroomModel?.data?[0].capacity);
      classrooms = classroomModel?.data;
      print(classrooms?[1].roomNumber);
      menuItems2 = classrooms!.map((classroom) {
        return DropdownMenuItem<String>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ShowClassroomsNSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsNErrorState(error.toString()));
    });
  }

  void getNotes(value)
  {
    emit(ShowNoticeLoadingState());
    DioHelper.getData(
      url: '${SHOWNOTES}/${value}',
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
