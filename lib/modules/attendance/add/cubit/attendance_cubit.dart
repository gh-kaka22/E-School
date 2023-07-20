import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/attendance_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  static AttendanceCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection;
  bool? checkbox = false;
  int? ischeck;
  DateTime selectedDate = DateTime.now();
  List<int> idStudents = [];
  changeCheck(bool val, int studentID) {
    print('Val && studentId : $val , $studentID');
    ischeck = val ? 1 : 0;
    if (val) {
      ischeck = 1;
      idStudents.add(studentID);
    } else {
      ischeck = 0;
      idStudents.remove(studentID);
    }
    print('Is Check ==> ${ischeck}');
    emit(CheckIsAbsentState());
    print(idStudents);
  }
  List<DropdownMenuItem> menuItemsClass = [
    DropdownMenuItem(
      value: '7',
      child: DropText(name: '7'),
    ),
    DropdownMenuItem(
      value: '8',
      child: DropText(name: '8'),
    ),
    DropdownMenuItem(
      value: '9',
      child: DropText(name: '9'),
    ),
  ];
  List<DropdownMenuItem> menuItemsSection = [];

  ShowStudentsModel? showStudentsModel;
  List<dynamic>? students;



///change class
  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(ShowStudentsClassDropDownButtonState());
  }
///change Section
  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(ShowStudentsSectionDropDownButtonState());
  }


///get Students
  void getStudents()
  {
    emit(AttendanceLoadingState());
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
    }).catchError((error){
      print(error.toString());
      emit(AttendanceErrorState(error.toString()));
    });
  }

  ///get students By Grade
  void getStudentsByGrade(value) {
    emit(AttendanceLoadingState());
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
    emit(AttendanceLoadingState());
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



///getClassrooms
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsXLoadingState());
    DioHelper.getData(
      url: GETCLASSROOMS,
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



///date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2008, 1),
        lastDate: DateTime(2101));


    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      print('Selected Date ==> ${selectedDate}');
      emit(DateState());
    }
  }
///add absence func
  AttendanceModel? attendanceModel;
  void AddAbsence({
    required students_id,
    required date,
  }) {
    emit(
      AttendanceLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ATTENDANCE,
      data: {
        'student_id': students_id,
        'date': DateFormat('yyyy-MM-dd').format(selectedDate),
      },
    )
        .then((value) {
      attendanceModel = AttendanceModel.fromJson(value?.data);
      emit(AttendanceSuccessState(attendanceModel!));
    })
        .catchError((error) {
      print("Error ===> ${error}");
      emit(
        AttendanceErrorState(error.toString()),
      );
    });
  }

}
