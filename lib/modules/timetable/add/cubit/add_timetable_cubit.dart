



import 'package:flutter/material.dart';
import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/add_timetable_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/classrooms/add/cubit/add_classroom_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/timetable/add/cubit/add_timetable_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddTimetableCubit extends Cubit<AddTimetableStates> {
  AddTimetableCubit() : super(AddTimetableInitialState());
  static AddTimetableCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection;
  String? dropDownValueDay;
  String? dropDownValueSubject1;
  String? dropDownValueSubject2;
  String? dropDownValueSubject3;
  String? dropDownValueSubject4;
  String? dropDownValueSubject5;
  String? dropDownValueSubject6;
  String? dropDownValueSubject7;

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
  List<DropdownMenuItem> menuItemsDay = [
    DropdownMenuItem(
      value: '1',
      child: Text('Sunday'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Monday'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('Tuesday'),
    ),
    DropdownMenuItem(
      value: '4',
      child: Text('Wednesday'),
    ),
    DropdownMenuItem(
      value: '5',
      child: Text('Thursday'),
    ),
  ];
  List<DropdownMenuItem> menuItemsSubject1 = [];
  List<DropdownMenuItem> menuItemsSubject2 = [];
  List<DropdownMenuItem> menuItemsSubject3 = [];
  List<DropdownMenuItem> menuItemsSubject4 = [];
  List<DropdownMenuItem> menuItemsSubject5 = [];
  List<DropdownMenuItem> menuItemsSubject6 = [];
  List<DropdownMenuItem> menuItemsSubject7 = [];


  // drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(AddTimetableClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(AddTimetableSectionDropDownButtonState());
  }
  void changeDayDropDownButton(String newValue)
  {
    dropDownValueDay = newValue;
    emit(AddTimetableDayDropDownButtonState());
  }
  void changeSubject1DropDownButton(String newValue)
  {
    dropDownValueSubject1 = newValue;
    emit(AddTimetableSubject1DropDownButtonState());
  }
  void changeSubject2DropDownButton(String newValue)
  {
    dropDownValueSubject2 = newValue;
    emit(AddTimetableSubject2DropDownButtonState());
  }
  void changeSubject3DropDownButton(String newValue)
  {
    dropDownValueSubject3 = newValue;
    emit(AddTimetableSubject3DropDownButtonState());
  }
  void changeSubject4DropDownButton(String newValue)
  {
    dropDownValueSubject4 = newValue;
    emit(AddTimetableSubject4DropDownButtonState());
  }
  void changeSubject5DropDownButton(String newValue)
  {
    dropDownValueSubject5 = newValue;
    emit(AddTimetableSubject5DropDownButtonState());
  }
  void changeSubject6DropDownButton(String newValue)
  {
    dropDownValueSubject6 = newValue;
    emit(AddTimetableSubject6DropDownButtonState());
  }
  void changeSubject7DropDownButton(String newValue)
  {
    dropDownValueSubject7 = newValue;
    emit(AddTimetableSubject7DropDownButtonState());
  }


  // bringing classrooms and putting them in their drop down button
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsTLoadingState());
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
      emit(ShowClassroomsTSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsTErrorState(error.toString()));
    });
  }


// bringing subjects and putting them in their drop down button
  SubjectModel? subjectModel;
  List<dynamic>? subjects;
  void getSubjects()
  {
    emit(ShowSubjectsTLoadingState());
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
      print(subjects?[1].subjectId);
      menuItemsSubject1 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      menuItemsSubject2 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      menuItemsSubject3 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      menuItemsSubject4 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      menuItemsSubject5 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      menuItemsSubject6 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      menuItemsSubject7 = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: '${subject.subjectId}',
          child: Text(subject.name),
        );
      }).toList();
      emit(ShowSubjectsTSuccessState(subjectModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSubjectsTErrorState(error.toString()));
    });
  }

  AddTimetableModel? addTimetableModel;
  void AddTimetable(
      {
        required  roomNumber,
        required  grade_id,
        required  day_id,
        required  first,
        required  second,
        required  third,
        required  fourth,
        required  fifth,
        required  sixth,
        seventh,
        required  token,
      }
      )
  {
    emit(
      AddTimetableLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDTIMETABLE,
      data: {
        'room_number': roomNumber,
        'grade_id': grade_id,
        'day_number': day_id,
        'first_subject': first,
        'second_subject': second,
        'third_subject': third,
        'fourth_subject': fourth,
        'fifth_subject': fifth,
        'sixth_subject': sixth,
        'seventh_subject':seventh,
      },
    ).then((value) {
      print(value?.data);
      addTimetableModel = AddTimetableModel.fromJson(value?.data);
      print(addTimetableModel!.data?.dayNumber);
      emit(AddTimetableSuccessState(addTimetableModel!));
    }).catchError((error) {
      print("momo ${error.response.data}");
      emit(
        AddTimetableErrorState(error.toString()),
      );
    });


  }
}
