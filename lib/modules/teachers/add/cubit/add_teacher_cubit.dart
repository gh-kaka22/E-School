import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/teacher_model.dart';
import 'package:untitled/shared/components/constants.dart';

import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'add_teacher_state.dart';

class AddTeacherCubit extends Cubit<AddTeacherState> {
  AddTeacherCubit() : super(AddTeacherInitial());
  TeacherModel? teacher;
  String? sub;
  static AddTeacherCubit get(context) => BlocProvider.of(context);
  void AddTeacher(
      {
        required String first_name,
        required String last_name,
        required String phone_number,
        required String address,
        required int subject,
        required roomnumber,

      }
      )
  {
    emit(
      AddTeacherLoading(),
    );
    DioHelper.postData(
      url: ADDTEACHER,
      token: token,
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'address': 'address',
        'subject_id': subID,
        'address':'address',

        'classrooms[0]':1,
      },
    ).then((value) {
      teacher = TeacherModel.fromJson(value?.data);
      print(teacher?.data);
      emit(AddTeacherSuccess(teacher!));
    })
        .catchError((error) {
      print("momo ${error.toString()}");
      emit(
        AddTeacherError(error.toString()),

      );

    });


  }
  List<DropdownMenuItem<String>> Subject = [
    DropdownMenuItem(
      value: 'Math',
      child: Text('Math'),
    ),
    DropdownMenuItem(
      value: 'Arabic',
      child: Text('Arabic'),
    ),
    DropdownMenuItem(
      value: 'Scince',
      child: Text('Scince'),
    ),
    DropdownMenuItem(
      value: 'Physics',
      child: Text('Physics'),
    ),
    DropdownMenuItem(
      value: 'Chemistry',
      child: Text('Chemistry'),
    ),
    DropdownMenuItem(
      value: 'English',
      child: Text('English'),
    ),
    DropdownMenuItem(
      value: 'French',
      child: Text('French'),
    ),

  ];
  int? subID;
  void changeDropDownButton(String newValue) {
    sub = newValue;
    print('${Subject}');
    if(sub=='Math')
      subID=1;
    if(sub=='Arabic')
      subID=2;
    if(sub=='Scince')
      subID=3;
    if(sub=='Physics')
      subID=4;
    if(sub=='Chemistry')
      subID=5;
    if(sub=='English')
      subID=6;
    if(sub=='French')
      subID=7;

    emit(SubjectState());
  }
}

