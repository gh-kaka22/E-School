import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/attendance_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  static AttendanceCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection = 'A';

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
  List<DropdownMenuItem> menuItems2 = [
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
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ShowStudentsClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(ShowStudentsSectionDropDownButtonState());
  }
  AttendanceModel? attendanceModel;
  List<dynamic>? students;
  void getStudentsByGrade(value)
  {
    emit(AttendanceLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      attendanceModel = AttendanceModel.fromJson(value?.data);
      print(attendanceModel?.status);
      print(attendanceModel?.message);
      print(attendanceModel?.data?[0].email);
      students = attendanceModel?.data as List?;
      print(students?[1].religion);
      emit(AttendanceSuccessState(attendanceModel!));
    }).catchError((error){
      print(error.toString());
      emit(AttendanceErrorState(error.toString()));
    });
  }

  void getStudents()
  {
    emit(AttendanceLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      attendanceModel = AttendanceModel.fromJson(value?.data);
      print(attendanceModel?.status);
      print(attendanceModel?.message);
      print(attendanceModel?.data?[0].email);
      students = attendanceModel?.data;
      print(students?[1].religion);
      emit(AttendanceSuccessState(attendanceModel!));
    }).catchError((error){
      print(error.toString());
      emit(AttendanceErrorState(error.toString()));
    });
  }


}
