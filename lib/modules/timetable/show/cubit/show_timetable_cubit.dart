



import 'package:flutter/material.dart';

import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_timetable_model.dart';
import 'package:untitled/models/subject_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/modules/timetable/show/cubit/show_timetable_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowTimetableCubit extends Cubit<ShowTimetableStates> {
  ShowTimetableCubit() : super(ShowTimetableInitialState());
  static ShowTimetableCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection;
  String? dropDownValueDay;


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



  // drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(ShowTimetableClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(ShowTimetableSectionDropDownButtonState());
  }
  void changeDayDropDownButton(String newValue)
  {
    dropDownValueDay = newValue;
    emit(ShowTimetableDayDropDownButtonState());
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


  ShowTimetableModel? showTimetableModel;
  void ShowTimetable(
      {
        required  roomNumber,
        required  grade_id,
        required  day_id,
        required  token,
      }
      )
  {
    emit(
      ShowTimetableLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: SHOWTIMETABLE,
      data: {
        'room_number': roomNumber,
        'grade_id': grade_id,
        'day_number': day_id,
      },
    ).then((value) {
      print(value?.data);
      showTimetableModel = ShowTimetableModel.fromJson(value?.data);
      print(showTimetableModel!.data.dayNumber);
      emit(ShowTimetableSuccessState(showTimetableModel!));
    }).catchError((error) {
      print("momo ${error.response.data}");
      emit(
        ShowTimetableErrorState(error.toString()),
      );
    });


  }
}
