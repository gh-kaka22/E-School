import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_exams_entered_model.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/attendance_model.dart';
import 'package:untitled/models/attendance_model.dart';
import 'package:untitled/models/attendance_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/student_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  static AttendanceCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '8';
  String? dropDownValueSection = '1';
  bool? checkbox = false;
  int? ischeck;
  DateTime selectedDate = DateTime.now();
  List<int> idStudents = [];

  changeCheck(bool val, int studentID) {
    print('Maysaaaaaaaaa : $val , $studentID');
    ischeck = val ? 1 : 0;
    if (val) {
      ischeck = 1;
      idStudents.add(studentID);
    } else {
      ischeck = 0;
      idStudents.remove(studentID);
    }
    print('maysa ya maysa ${ischeck}');
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

  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    emit(ShowStudentsClassDropDownButtonState());
  }

  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(ShowStudentsSectionDropDownButtonState());
  }

 // AttendanceModel? attendanceModel;
  AddExamsModel? addExamsModel;
  List<dynamic>? students;


  void getStudents()
  {
    emit(AttendanceLoadingState());
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
      emit(AttendanceErrorState(error.toString()));
    });
  }





  void getStudentsByGrade(value) {
    emit(AttendanceLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      addExamsModel = AddExamsModel.fromJson(value?.data);
      print(addExamsModel?.status);
      print(addExamsModel?.message);
      students = addExamsModel?.data;
      print(students?[1].religion);
      emit(AddExamsSuccessState(addExamsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AttendanceErrorState(error.toString()));
    });
  }




  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms()
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






  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2008, 1),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      print('messooo ${selectedDate}');
      emit(DateState());
    }
  }

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
        'date': '2020-02-02',
        //DateFormat('yyyy-MM-dd').format(selectedDate),
      },
    )
        .then((value) {
      attendanceModel = AttendanceModel.fromJson(value?.data);
      emit(AttendanceSuccessState(attendanceModel!));
    })
        .catchError((error) {
      print("koko ${error}");
      emit(
        AttendanceErrorState(error.toString()),
      );
    });
  }

}
