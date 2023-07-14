import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/update_student_model.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'update_students_state.dart';

class UpdateStudentsCubit extends Cubit<UpdateStudentsState> {
  UpdateStudentsCubit() : super(UpdateStudentsInitial());

  static UpdateStudentsCubit get(context) => BlocProvider.of(context);
  UpdateStudentModel? updateStudentModel;
  String? grade;
  String? dropDownValue;
  int? gradeID;
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
    emit(ReligionState());
  }

  void changeGradeDropDownButton(String gr) {
    print('gggg $gr');
    grade = gr;
    if (grade == 'Seventh') gradeID = 7;

    if (grade == 'Eighth') gradeID = 8;

    if (grade == 'Ninth') gradeID = 9;

    emit(GradeState());
    print('grade: ${grade}');
    print('grade Id: ${gradeID}');
  }
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:selectedDate,
        firstDate: DateTime(2008, 1),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      print('date:  ${selectedDate}');
      emit(DateOfBirth());
    }
  }
  void getStudentData(student_id) {
    emit(ShowStudentInfoLoading());
    DioHelper.getData(
      url: '${SHOWSTUDENTBYID}/${1}',
      token: token,
    ).then((value) {
      updateStudentModel = UpdateStudentModel.fromJson(value!.data);
      print(updateStudentModel!.data!.firstName);
      emit(ShowStudentInfoSuccess(updateStudentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentInfoError(error));
    });
  }

  void UpdateStudentData({
    firstname,
    lastname,
    firstFatherName,
    firstMotherName,
    lastMotherName,
    fatherPhoneNumber,
    motherPhoneNumber,
    address,
    details,
    nationalId,
    grade_number,
    date_of_birth,
    religion,
  }) {
    emit(UpdateStudentsLoading());
    DioHelper.puttData(
      url: '${UPDATESTUDENT}/1',
      token: token,
      data: {
        'first_name': firstname,
        'address': address,
        'details': details,
        'father_first_name': firstFatherName,
        'father_phone_number': fatherPhoneNumber,
        'mother_first_name': firstMotherName,
        'mother_last_name': lastMotherName,
        'mother_phone_number': motherPhoneNumber,
        'national_id': nationalId,
        'religion': dropDownValue.toString(),
        'date_of_birth': DateFormat('yyyy-MM-dd').format(selectedDate).toString(),
      },
    ).then((value) {
      print(value?.data);
      if (value!.data['status']) {
        updateStudentModel = UpdateStudentModel.fromJson(value.data);
        print(updateStudentModel?.data);
        emit(UpdateStudentsSuccess(updateStudentModel!));
      } else {
        emit(UpdateStudentsError(value.data['message']));
      }
    }).catchError((error) {
      print("koko ${(error)}");
      emit(
        UpdateStudentsError(error.toString()),
      );
    });
  }
}
