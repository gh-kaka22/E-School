import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/show_Attendance_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_state.dart';
import 'package:untitled/shared/components/attendance.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
import 'package:untitled/styles/colors.dart';

class ShowAttendanceCubit extends Cubit<ShowAttendanceStates> {
  ShowAttendanceCubit() : super(ShowAttendanceInitialState());

  static ShowAttendanceCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection = 'A';

  List<DropdownMenuItem> menuItems = [
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
  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    emit(ShowStudentsClassDropDownButtonState());
  }

  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(ShowStudentsSectionDropDownButtonState());
  }

  ShowAttendanceModel? showAttendanceModel;
  ShowStudentsModel? showStudentsModel;

  List<dynamic>? students;
  List<dynamic>? absence;

  void getStudents() {
    emit(ShowAttendanceLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0].address);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }

  // void getStudentsByGrade(value)
  // {
  //   emit(ShowStudentsLoadingState());
  //   DioHelper.getData(
  //     url: '${GETSTUDENTSBYGRADE}/${value}',
  //     token: token,
  //   ).then((value) {
  //     print(value?.data);
  //     showStudentsModel = ShowStudentsModel.fromJson(value?.data);
  //     print(showStudentsModel?.status);
  //     print(showStudentsModel?.message);
  //     print(showStudentsModel?.data?[0].email);
  //     students = showStudentsModel?.data;
  //     print(students?[1].religion);
  //     emit(ShowStudentsSuccessState(showStudentsModel!));
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(ShowStudentsErrorState(error.toString()));
  //   });
  // }

  void getAttenadnce() {
    emit(ShowAttendanceLoadingState());
    DioHelper.getData(
      url: SHOWATTENDANCE,
      token: token,
    ).then((value) {
      print(value?.data);
      showAttendanceModel = ShowAttendanceModel.fromJson(value?.data);
      print(showAttendanceModel?.status);
      print(showAttendanceModel?.message);
      print(showAttendanceModel?.data?[0]);
      absence = showAttendanceModel?.data ;
      print(showAttendanceModel?.data![0].date);
      emit(ShowAttendanceSuccessState(showAttendanceModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowAttendanceErrorState(error.toString()));
    });
  }

  void showAbcenceDialog({
    required BuildContext context,
    Function? getAttenadnce,
  }) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: MyText(name: "Absences", size: 25),
              content:
              // Text('${showAttendanceModel!.data?[0].date}'),
              ShowAbsentBuilder(
                  100,
                  showAttendanceModel?.data,
                  context,
                  state
              ),

              actions: [
                ElevatedButton(

      onPressed: () {
        if (getAttenadnce != null) { // check if getAttenadnce is not null
          getAttenadnce(); // call the function
        }
                  },
                  child: Text("OK"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Colors.white, //change background color of button
                    backgroundColor: kGold1Color, //change text color of button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                ),
              ],
            ));
  }
}
