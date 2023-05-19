import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/student_model.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../../shared/network/remote/end_points.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  StudentModel? student;

  static RegisterCubit get(context) => BlocProvider.of(context);
  String religiondropDownValue = 'Religion';
  String genderdropDownValue = 'Gender';

  List<DropdownMenuItem> religionitem = [

    DropdownMenuItem(
      value: '1',
      child: Text('Muslime'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Christian'),
    ),
  ];
  List<DropdownMenuItem> Gendertem = [

    DropdownMenuItem(
      value: '1',
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Female'),
    ),
  ];

  void StudentRegister(
      {
    required  first_name,
    required last_name,
    required father_name,
    required father_phone,
    required first_mother_name,
    required last_mother_name,
    required mother_phone,
    required address,
    required detailes,
    required religion,
    required gender,
    required grade_number,
    required have_sib,
  }
  )
  {
    emit(
      RegisterLoading(),
    );

    Diohelper.postData(
      url: RegisterStudent,
      data: {
        'firs_name': first_name,
        'last_name': last_name,
        'father_name': father_name,
        'father_phone_number': father_phone,
        'first_mother_name':first_mother_name,
        'last_mother_name': last_mother_name,
        'mother_phone_number': mother_phone,
        'address': address,
        'detailes': detailes,
        'religion': religionitem,
        'gender':gender,
        'grade_number': grade_number,

      },
    )
        .then((value) => {
              student = StudentModel.fromJson(value.data),
              print(student?.data),
              emit(RegisterSuccess()),
            })
        .catchError((error) {
          print(error);
      emit(
        RegisterError(error.toString()),
      );

    });

  }

  void ReligionchangeDropDownButton(newValue) {
    religiondropDownValue = newValue;
    emit(ReligionState());

  }
  void GenderchangeDropDownButton(newValue) {
    genderdropDownValue = newValue;
    emit(ReligionState());

  }
}
