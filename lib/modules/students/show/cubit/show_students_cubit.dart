import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_result_student.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

import '../../../../models/update_student_model.dart';

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
  List<dynamic>? results;
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

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(SearchStudentsLoadingState());
    DioHelper.getData(
        url: 'search_student',
        token: token,
        query: {
          'name':'$value',
        }
    ).then((value) {

      print(value?.data);
      if (value?.data is List) {
        search = value?.data;
      }
      else if (value?.data is Map) {
        final model = ShowStudentsModel.fromJson(value?.data);
        search = model.data;
      }
      emit(SearchStudentsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchStudentsErrorState(error.toString()));
    });
  }
  ResultStudentModel? resultStudentModel;
  Future<void>? getResultStudent(studentId) {
    emit(ShowResultLoadingState());
    DioHelper.getData(
      url: '${SHOWRESULTFORSTUDENT}/${studentId}',
      token: token,
    ).then((value) {
      print(value?.data);
      resultStudentModel = ResultStudentModel.fromJson(value?.data);
      print(resultStudentModel?.status);
      print(resultStudentModel?.message);
      print(resultStudentModel?.data?[0].result);
      results = resultStudentModel?.data ;
      print(resultStudentModel?.data![0].firstName);
      emit(ShowResultSuccessState(resultStudentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowResultStudentsErrorState(error.toString()));
    });
  }


  UpdateStudentModel? updateStudentModel;
  void getStudentData(student_id) {
    emit(ShowStudentInfoLoading());
    DioHelper.getData(
      url: '${SHOWSTUDENTBYID}/${student_id}',
      token: token,
    ).then((value) {
      updateStudentModel = UpdateStudentModel.fromJson(value!.data);
      print(updateStudentModel!.data!.firstName);
      emit(ShowStudentInfoSuccess(updateStudentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentInfoError(error));
    });
  }


}

