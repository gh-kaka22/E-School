import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/student_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';
part 'register_state.dart';
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  StudentModel? student;

  static RegisterCubit get(context) => BlocProvider.of(context);
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
    //required have_sib,
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
        'religion': religion,
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
  String? dropDownValue ;
  String? gender;
  String? grade;
  List<DropdownMenuItem<String>> ReligionItems = [
    DropdownMenuItem(
      value: 'Muslim',
      child: Text('Muslim'),

    ),
    DropdownMenuItem(
      value: 'Christian',
      child: Text('Christian'),

    ),

  ];
  List<DropdownMenuItem<String>> GenderItems = [
    DropdownMenuItem(
      value: "0",
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: "1",
      child: Text('Female'),
    ),
  ];
  List<DropdownMenuItem<String>> GradeItems = [
    DropdownMenuItem(
      value: 'Seventh',
      child: Text('Seventh'),
    ),
    DropdownMenuItem(
      value: 'Eighth',
      child: Text('Eighth'),
    ),
    DropdownMenuItem(
      value: 'Ninth',
      child: Text('Ninth'),
    ),
  ];
  void changeDropDownButton(String newValue)
  {
    dropDownValue = newValue;
    emit(ReligionDropDownButtonState());
  }
  void changeGenderDropDownButton(String ng)
  {
    gender = ng;
    emit(GenderchangeDropDownButton());
  }
  void changeGradeDropDownButton(String gr)
  {
    grade = gr;
    emit(GradechangeDropDownButton());
  }

}

