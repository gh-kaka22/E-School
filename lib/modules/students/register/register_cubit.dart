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
  static RegisterCubit get(context) => BlocProvider.of(context);

  StudentModel? studentModel;
  bool isChecked = false;
  String currText = 'Don\'t have siblings';
  String? dropDownValue;
  String? gender;
  String? grade;
  String? gradenumber;
  int? ischeck;


  changeCheck(val) {
    isChecked = val!;
    if (isChecked)
      ischeck = 0;
    else
      ischeck = 1;
    print('have kids:  ${ischeck}');

    emit(CheckBoxState());
  }

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
    required have_kids,
    required date_of_birth,
    required national_id,
  }) {
    emit(RegisterLoading());
    Map<String, dynamic> body = {
      'first_name': first_name,
      'last_name': last_name,
      'date_of_birth': DateFormat('yyyy-MM-dd').format(selectedDate).toString(),
      if (ischeck == 0) 'father_first_name': father_name,
      if (ischeck == 0) 'father_phone_number': father_phone,
      if (ischeck == 0) 'mother_first_name': first_mother_name,
      if (ischeck == 0) 'mother_last_name': last_mother_name,
      if (ischeck == 0) 'mother_phone_number': mother_phone,
      'address': address,
      'details': detailes,
      'religion': dropDownValue.toString(),
      'gender_id': gender.toString(),
      'grade_number': gradeID.toString(),
      "have_kids": ischeck,
      'national_id': national_id.toString(),
    };

    print('body= $body');
    DioHelper.postData(
      url: RegisterStudent,
      token: token,
      data: body,
    ).then((value) {
      print(value?.data);
      if (value!.data['status']) {
        studentModel = StudentModel.fromJson(value?.data);
        print(studentModel?.data);
        emit(RegisterSuccess(studentModel!));
      } else {
        emit(RegisterError(value.data['message']));
      }
    }).catchError((error) {
      print("koko ${(error)}");
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
  int? gradeID;
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

  void changeDropDownButton(String newValue) {
    dropDownValue = newValue;
    print('${dropDownValue}');
    emit(ReligionDropDownButtonState());
  }

  void changeGenderDropDownButton(String ng) {
    print('${ng}');
    gender = ng;
    print('gender:  ${gender}');
    emit(GenderchangeDropDownButton());
  }

  void changeGradeDropDownButton(String gr) {
    print('gggg $gr');
    grade = gr;
    if (grade == 'Seventh') gradeID = 7;

    if (grade == 'Eighth') gradeID = 8;

    if (grade == 'Ninth') gradeID = 9;

    emit(GradechangeDropDownButton());
    print('grade: ${grade}');
    print('grade Id: ${gradeID}');
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
      print('date:  ${selectedDate}');
      emit(DateOfBirth());
    }
  }
}
