import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/class_one_student_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/update_student_model.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/end_points.dart';
part 'update_students_state.dart';

class UpdateStudentsCubit extends Cubit<UpdateStudentsState> {
  UpdateStudentsCubit() : super(UpdateStudentsInitial());

  static UpdateStudentsCubit get(context) => BlocProvider.of(context);
  UpdateStudentModel? updateStudentModel;
  ClassOneStudentModel? classOneStudentModel;
  bool isChecked = true;
  String? ischeck;
  String currText = 'Active';
  String? dropDownValueClass = '7';


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


  changeCheck(val) {
    isChecked = val!;
    if (isChecked)
      ischeck = 'active';
    else
      ischeck ='unactive';
    print('Active or no :  ${ischeck}');

    emit(CheckState());
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
      url: '${SHOWSTUDENTBYID}/${student_id}',
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
    status,
  }) {
    emit(UpdateStudentsLoading());
    DioHelper.postData(
      url: '${UPDATESTUDENT}/${updateStudentModel?.data?.studentId}',
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
        'date_of_birth': DateFormat('yyyy-MM-dd').format(selectedDate).toString(),
        'status':status,
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
