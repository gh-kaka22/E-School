import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/student_model.dart';
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
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'father_name': father_name,
        'father_phone_number': father_phone,
        'mother_first_name': first_mother_name,
        'mother_last_name': last_mother_name,
        'mother_phone_number': mother_phone,
        'address': address,
        'details': detailes,
        'religion': dropDownValue,
        'gender_id': gender,
        "have_kids": ischeck,
        'grade_number': grade,
        'date_of_birth': DateFormat('yyyy/MM/dd').format(selectedDate),
        'national_id': father_national_id,
      },
    )
        .then((value) => {
              student = StudentModel.fromJson(value!.data),
              print(student?.data!.email),
              emit(RegisterSuccess()),
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
