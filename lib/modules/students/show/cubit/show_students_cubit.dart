import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowStudentsCubit extends Cubit<ShowStudentsStates> {
  ShowStudentsCubit() : super(ShowStudentsInitialState());

  static ShowStudentsCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = 'Seventh';
  String? dropDownValueSection = 'A';

  List<DropdownMenuItem> menuItems = [
    DropdownMenuItem(
      value: 'Seventh',
      child: Text('Seventh'),
    ),
    DropdownMenuItem(
      value: 'Eighth',
      child: Text('Eighth'),
    ),
    DropdownMenuItem(
      value: 'Nineth',
      child: Text('Nineth'),
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
      print(showStudentsModel?.data?[0].email);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }






}

