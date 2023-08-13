import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_Attendance_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_state.dart';
import 'package:untitled/shared/components/attendance.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
import 'package:untitled/styles/colors.dart';

class ShowAttendanceCubit extends Cubit<ShowAttendanceStates> {
  ShowAttendanceCubit() : super(ShowAttendanceInitialState());

  static ShowAttendanceCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection ;

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
  List<DropdownMenuItem> menuItemsSection = [];
  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(ShowStudentsClassDropDownButtonState());
  }

  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(ShowStudentsSectionDropDownButtonState());
  }

  ShowAttendanceModel? showAttendanceModel;
  ShowStudentsModel? showStudentsModel;

  List<dynamic>? students;
  List<dynamic>? absence;

  void getStudents() {
    emit(ShowAttendanceLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0].address);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }

  void getStudentsByGrade(value) {
    emit(ShowAttendanceLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }


  void getStudentsByGradeAndClassroom(grade,classroom)
  {
    emit(ShowAttendanceLoadingState());
    DioHelper.postData(
      url: GETSTUDENTSBYGRADEANDCLASSROOM,
      data:{
        'grade_id': grade,
        'room_number': classroom,
      },
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0]);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }



  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsXLoadingState());
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
      menuItemsSection = classrooms!.map((classroom) {
        return DropdownMenuItem<dynamic>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ShowClassroomsXSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsXErrorState(error.toString()));
    });
  }


  Future<void>? getAttenadnce(studentId) {
    emit(ShowAttendanceLoadingState());
    DioHelper.getData(
      url: '${SHOWATTENDANCE}/${studentId}',
      token: token,
    ).then((value) {
      print(value?.data);
      showAttendanceModel = ShowAttendanceModel.fromJson(value?.data);
      print(showAttendanceModel?.status);
      print(showAttendanceModel?.message);
      print(showAttendanceModel?.data?[0]);
      absence = showAttendanceModel?.data ;
      print(showAttendanceModel?.data![0].date);
      emit(ShowAttendanceSuccessState(showAttendanceModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowAttendanceErrorState(error.toString()));
    });
  }



}
