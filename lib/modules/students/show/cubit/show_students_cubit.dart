import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowStudentsCubit extends Cubit<ShowStudentsStates> {
  ShowStudentsCubit() : super(ShowStudentsInitialState());

  static ShowStudentsCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection;

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



  // drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(ShowStudentsClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(ShowStudentsSectionDropDownButtonState());
  }

  ShowStudentsModel? showStudentsModel;
  List<dynamic>? students;
  void getStudents()
  {
    emit(ShowStudentsLoadingState());
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
    }).catchError((error){
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }
  void getStudentsByGrade(value)
  {
    emit(ShowStudentsLoadingState());
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
  void getStudentsByGradeAndClassroom(grade,classroom)
  {
    emit(ShowStudentsLoadingState());
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

  // bringing classrooms and putting them in their drop down button
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsSLoadingState());
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
        return DropdownMenuItem<dynamic>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ShowClassroomsSSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsSErrorState(error.toString()));
    });
  }






}

