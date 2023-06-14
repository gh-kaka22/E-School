import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/student_model.dart';
import 'package:untitled/shared/components/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  StudentModel? student;
  bool isChecked = false;
  String currText = 'Don\'t have siblings';
  String? dropDownValue;

  String? gender;
  String? grade;
  String? gradenumber;
  int? ischeck;

  changeCheck(val) {
    isChecked = val!;
    if (isChecked == false)
      ischeck = 0;
    else
      ischeck = 1;
    print('maysa ya maysa ${ischeck}');

    emit(CheckBox());
  }

  static RegisterCubit get(context) => BlocProvider.of(context);

  void StudentRegister({
    required first_name,
    required last_name,
    required father_name,
    required father_phone,
    required first_mother_name,
    required last_mother_name,
    required mother_phone,
    required address,
    required detailes,
    required religion,
    required genderr,
    required grade_number,
    required have_sib,
    required date_of_birth,
    required father_national_id,
  }) {
    emit(
      RegisterLoading(),
    );
    DioHelper.postData(
      url: RegisterStudent,
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmU2MWNkNjI4MzJlZjUxMjE3NDJmYTI4ZTRlNzkxNmQ3ZjM5MDA0YjYwYThhMTZkM2Y3Yzc4ZWM3N2Q3NzM3MzkyZDA1YzEzOTE5MWI1YzMiLCJpYXQiOjE2ODY3MzU2NzUuNTkxMjg5LCJuYmYiOjE2ODY3MzU2NzUuNTkxMjk4LCJleHAiOjE3MTgzNTgwNzUuNTg2NDE0LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.dZXGkCqsAp9atGIOM5HBHpcGtx1drmbNwdgGnbTp1t_9wzyaahHTGsy40P1k_XHj0MK99C3fJtdUfNtH7fMjNgDqimJgWMud4p6q3st0N-s9rS22eVTXrofxTD4MBZMMW2g-ke0dZpp7SAo6Q9E3YmGtSX-ZgCB_Rd9TuDZn3OincjYaUgompM_K5QSSTVNm9Dd_odbwkfWOd2OZmzaJzGV6tXaMRgmUKZkFvyCA7Hv2uM5rRLz9xPA5zkycYWzZrQA-8s8rfaGXoWo3InSmBADusE_jXaTr--P8nMV63NNN6GTpFbjIN0D3yymnU8b-am7u03kvbPWlnZiVm9Z9Wllv59k5ny3ovkWhHUGxbgOebUCFoINTMwxZvwclZw7j--74NVUwdsEnSwuzUX1Ew-UB5CNN75B8yZ3n6bsvIu_TkvWOeSHGgP-w0XGzbTjrmeyOAGtgM8QTesyTZYQ616nCB7rlULny4uQOqovQ9NHdnMzcGC01GRVU-2Py0a4svc_iE1RphBvarS3TeqlpFZ4V8Bd_l96Qna5wuJNIj4mRPCTSHYYhlnlFmYU865l3w2ygo54ezXGb_UX79scHT3vxox95lXV9d5QYa8oVysJj2gLDG6QMSXeIJHXa0xtKGw42T7E0Ncwr0JvnufwOlDco1Fqdo0LmzLKEnlTA-FM' ,
      data: {
        'first_name': first_name,
        'last_name': last_name,
        if(isChecked)
        'father_name': father_name,
        if(isChecked)
        'father_phone_number': father_phone,
        if(isChecked)
        'mother_first_name': first_mother_name,
        if(isChecked)
        'mother_last_name': last_mother_name,
        if(isChecked)
        'mother_phone_number': mother_phone,
        'address': address,
        'details': detailes,
        'religion': dropDownValue,
        'gender_id': gender,
        "have_kids": ischeck,
        'grade_number': grade,
        'date_of_birth': DateFormat('yyyy-MM-dd').format(selectedDate),
        'national_id': father_national_id,

      },
    )
        .then((value) {
          print(value);
      if(value!.data['status'])    {
        student = StudentModel.fromJson(value.data);
        print(student?.data);
        emit(RegisterSuccess());
      }else{
        emit(RegisterError(value.data['message']));
      }
    })
        .catchError((error) {
      print("koko ${error}");
      emit(
        RegisterError(error.toString()),
      );
    });
  }

  List<DropdownMenuItem<String>> ReligionItems = [
    DropdownMenuItem(
      value: 'muslim',
      child: Text('Muslim'),
    ),
    DropdownMenuItem(
      value: 'christian',
      child: Text('Christian'),
    ),
  ];

  List<DropdownMenuItem<String>> GenderItems = [
    DropdownMenuItem(
      value: "1",
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: "2",
      child: Text('Female'),
    ),
  ];
  List<DropdownMenuItem<String>> GradeItems = [
    DropdownMenuItem(
      value: '1',
      child: Text('Seventh'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Eighth'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('Ninth'),
    ),
  ];

  void changeDropDownButton(String newValue) {
    dropDownValue = newValue;
    print('${dropDownValue}');
    emit(ReligionDropDownButtonState());
  }

  void changeGenderDropDownButton(String ng) {
    print('${ng}');
    gender = ng;
    print('maysa ${gender}');
    emit(GenderchangeDropDownButton());
  }

  void changeGradeDropDownButton(String gr) {
    print('gggg $gr');
    grade = gr;
    emit(GradechangeDropDownButton());
  }

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
      emit(DateOfBirth());
    }
  }
}
