import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/school_year_model.dart';
import 'package:untitled/models/show_exams_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowExamsCubit extends Cubit<ShowExamsStates> {
  ShowExamsCubit() : super(ShowExamsInitialState());

  static ShowExamsCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection;
  String? dropDownValueSubject='none';
  String? dropDownValueType;
  String? dropDownValueYear='2022/2023';
// drop down buttons' lists
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
  List<DropdownMenuItem> menuItemsSubject = [];
  List<DropdownMenuItem> menuItemsType = [
    DropdownMenuItem(
      value: '1',
      child: Text('T1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Mid'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('T2'),
    ),
    DropdownMenuItem(
      value: '4',
      child: Text('Final'),
    ),
  ];
  List<DropdownMenuItem> menuItemsYear = [];

// drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(ShowExamsClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(ShowExamsSectionDropDownButtonState());
  }
  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
    emit(ShowExamsSubjectDropDownButtonState());
  }
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(ShowExamsTypeDropDownButtonState());
  }
  void changeYearDropDownButton(String newValue)
  {
    dropDownValueYear = newValue;
    emit(ShowExamsYearDropDownButtonState());
  }


  //bringing Students
  ShowExamsModel? showExamsModel;
  List<dynamic>? students;
  void getStudents()
  {
    emit(ShowExamsLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      showExamsModel = ShowExamsModel.fromJson(value?.data);
      print(showExamsModel?.status);
      print(showExamsModel?.message);
      print(showExamsModel?.data?[0]);
      students = showExamsModel?.data;
      print(students?[1].religion);
      emit(ShowExamsSuccessState(showExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamsErrorState(error.toString()));
    });
  }
  //bringing students by grade
  void getStudentsByGrade(value)
  {
    emit(ShowExamsLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      showExamsModel = ShowExamsModel.fromJson(value?.data);
      print(showExamsModel?.status);
      print(showExamsModel?.message);
      print(showExamsModel?.data?[0]);
      students = showExamsModel?.data;
      print(students?[1].religion);
      emit(ShowExamsSuccessState(showExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamsErrorState(error.toString()));
    });
  }
  //bringing students by grade and classroom
  void getStudentsByGradeAndClassroom(grade,classroom)
  {
    emit(ShowExamsLoadingState());
    DioHelper.postData(
      url: GETSTUDENTSBYGRADEANDCLASSROOM,
      data:{
        'grade_id': grade,
        'room_number': classroom,
      },
      token: token,
    ).then((value) {
      print(value?.data);
      showExamsModel = ShowExamsModel.fromJson(value?.data);
      print(showExamsModel?.status);
      print(showExamsModel?.message);
      print(showExamsModel?.data?[0]);
      students = showExamsModel?.data;
      print(students?[1].religion);
      emit(ShowExamsSuccessState(showExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamsErrorState(error.toString()));
    });
  }
  void getStudentsMarks(grade,classroom,subject,type,year)
  {
    emit(ShowExamsLoadingState());
    DioHelper.postData(
      url: SHOWEXAMS,
      data:{
        'grade_id': grade,
        'room_number': classroom,
        'subject_name':subject,
        'type_id':type,
        'schoolyear':year,
      },
      token: token,
    ).then((value) {
      print(value?.data);
      showExamsModel = ShowExamsModel.fromJson(value?.data);
      print(showExamsModel?.status);
      print(showExamsModel?.message);
      print(showExamsModel?.data[0]);
      students = showExamsModel?.data;
      print(students?[0].mark);
      emit(ShowExamsSuccessState(showExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowExamsErrorState(error.toString()));
    });
  }

  // bringing classrooms and putting them in their drop down button
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


// bringing subjects and putting them in their drop down button
  SubjectModel? subjectModel;
  List<dynamic>? subjects;
  void getSubjects()
  {
    emit(ShowSubjectsXLoadingState());
    DioHelper.getData(
      url: GETSUBJECTS,
      token: token,
    ).then((value) {
      print(value?.data);
      subjectModel = SubjectModel.fromJson(value?.data);
      print(subjectModel?.status);
      print(subjectModel?.message);
      print(subjectModel?.data?[0].name);
      subjects = subjectModel?.data;
      print(subjects?[1].name);
      menuItemsSubject = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: subject.name,
          child: Text(subject.name),
        );
      }).toList();
      emit(ShowSubjectsXSuccessState(subjectModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSubjectsXErrorState(error.toString()));
    });
  }



// bringing schoolyears and putting them in their drop down button
  SchoolYearModel? schoolYearModel;
  List<dynamic>? schoolYears;
  void getSchoolYear()
  {
    emit(ShowSchoolYearXLoadingState());
    DioHelper.getData(
      url: GETSCHOOLYEARS,
      token: token,
    ).then((value) {
      print(value?.data);
      schoolYearModel = SchoolYearModel.fromJson(value?.data);
      print(schoolYearModel?.status);
      print(schoolYearModel?.message);
      print(schoolYearModel?.data?[0].name);
      schoolYears = schoolYearModel?.data;
      print(schoolYears?[1].name);

      menuItemsYear = schoolYears!.map((year) {
        return DropdownMenuItem<dynamic>(
          value: year.name,
          child: Text(year.name),
        );
      }).toList();
      print('schoolYears?[1].name');
      emit(ShowSchoolYearXSuccessState(schoolYearModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSchoolYearXErrorState(error.toString()));
    });
  }




}

