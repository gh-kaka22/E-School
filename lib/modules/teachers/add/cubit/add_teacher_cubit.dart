import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/teacher_model.dart';

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
         String? details,
        required int subject,

      }
      )
  {
    emit(
      AddTeacherLoading(),
    );
    DioHelper.postData(
      url: ADDTEACHER,
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'address': address,
        'subject_id': subject,
        'details':details,

      },
    ).then((value) {
      teacher = TeacherModel.fromJson(value?.data);
      print(teacher?.data);
      emit(AddTeacherSuccess(teacher!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
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
  void changeDropDownButton(String newValue) {
    sub = newValue;
    print('${Subject}');
    emit(SubjectState());
  }
}

