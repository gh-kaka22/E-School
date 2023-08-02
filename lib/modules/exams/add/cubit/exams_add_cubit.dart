import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/add_exams_entered_model.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/school_year_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/exams/add/cubit/exams_add_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddExamsCubit extends Cubit<AddExamsStates> {
  AddExamsCubit() : super(AddExamsInitialState());

  static AddExamsCubit get(context) => BlocProvider.of(context);

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
    dropDownValueSection='7A';
    getClassrooms(dropDownValueClass);
    emit(AddExamsClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(AddExamsSectionDropDownButtonState());
  }
  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
    emit(AddExamsSubjectDropDownButtonState());
  }
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(AddExamsTypeDropDownButtonState());
  }
  void changeYearDropDownButton(String newValue)
  {
    dropDownValueYear = newValue;
    emit(AddExamsYearDropDownButtonState());
  }


  //making an empty list for controllers that will be generated in builder
  List<TextEditingController> controllers = [];

//bringing Students
  AddExamsModel? addExamsModel;
  List<dynamic>? students;
  void getStudents()
  {
    emit(AddExamsLoadingState());
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
      emit(AddExamsErrorState(error.toString()));
    });
  }


  //bringing students by grade


  void getStudentsByGrade(value)
  {
    emit(AddExamsLoadingState());
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
      emit(AddExamsSuccessState(addExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(AddExamsErrorState(error.toString()));
    });
  }
//bringing students by grade and classroom
  void getStudentsByGradeAndClassroom(grade,classroom)
  {
    emit(AddExamsLoadingState());
    DioHelper.postData(
      url: GETSTUDENTSBYGRADEANDCLASSROOM,
      data:{
        'grade_id': grade,
        'room_number': classroom,
      },
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
      emit(AddExamsErrorState(error.toString()));
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
          value: '${year.name}',
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


// choosing date
  DateTime selectedDate = DateTime.now();
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


// method for sending the mark
  AddExamsEnteredModel? addExamsEnteredModel;
  void AddExam(
      {
        required studentId,
        required typeId,
        required subjectName,
        required mark,
        required schoolYear,
        required date,
        required token,
      }
      )
  {
    emit(
      AddExamsLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDEXAM,
      data: {
        'student_id': studentId,
        'mark': mark,
        'type_id':typeId,
        'subject_name':subjectName,
        'schoolyear':schoolYear,
        'date':date,
      },
    ).then((value) {
      print(value?.data);
      addExamsEnteredModel = AddExamsEnteredModel.fromJson(value?.data);
      emit(AddExamsEnteredSuccessState(addExamsEnteredModel!));
    })
        .catchError((error)
    {
          print(error);
      emit(
        AddExamsErrorState(error.toString()),
      );
    });


  }



}

