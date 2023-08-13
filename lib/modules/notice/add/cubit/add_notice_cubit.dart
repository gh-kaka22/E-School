import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/notice_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
import 'package:untitled/styles/colors.dart';
import '../../../../shared/components/components.dart';
part 'add_notice_state.dart';

class AddNoticeCubit extends Cubit<AddNoticeState> {
  AddNoticeCubit() : super(AddNoticeInitial());

  static AddNoticeCubit get(context) => BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection ;
  String? dropDownValueType = '1';
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
  List<DropdownMenuItem> menuItemsType = [
    DropdownMenuItem(
      value: '1',
      child: Text('Behavioral'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Late'),
    ),
  ];

  void changeClassDropDownButton(String newValue) {
    dropDownValueClass = newValue;
    emit(ClassDropDownButtonState());
  }

  void changeSectionDropDownButton(String newValue) {
    dropDownValueSection = newValue;
    emit(SectionDropDownButtonState());
  }

  void changeTypeDropDownButton(String newValue) {
    dropDownValueType = newValue;
    print('drooooooo${dropDownValueType}');
    emit(AddNoticeType());
  }

  List<TextEditingController> controllers = [];
  ShowStudentsModel? showStudentsModel;
  List<dynamic>? students;

  void getStudents() {
    emit(ShowStudentLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0].email);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AddNoticeErrorState(error.toString()));
    });
  }

  void getStudentByGrade(value) {
    emit(ShowStudentLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }

  void getStudentsByGradeAndClassroom(grade,classroom)
  {
    emit(ShowStudentLoadingState());
    DioHelper.postData(
      url: GETSTUDENTSBYGRADEANDCLASSROOM,
      data:{
        'grade_id': grade,
        'room_number': classroom,
      },
      token: token,
    ).then((value) {
      print(value?.data);
      showStudentsModel = ShowStudentsModel.fromJson(value?.data);
      print(showStudentsModel?.status);
      print(showStudentsModel?.message);
      print(showStudentsModel?.data?[0]);
      students = showStudentsModel?.data;
      print(students?[1].religion);
      emit(ShowStudentsSuccessState(showStudentsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowStudentsErrorState(error.toString()));
    });
  }

  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsXLoadingState());
    DioHelper.getData(
      url: '${GETCLASSROOMSOFAGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      classroomModel = ClassroomModel.fromJson(value?.data);
      print(classroomModel?.status);
      print(classroomModel?.message);
      print(classroomModel?.data?[0].capacity);
      classrooms = classroomModel?.data;
      print(classrooms?[1].roomNumber);
      menuItemsSection = classrooms!.map((classroom) {
        return DropdownMenuItem<String>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ShowClassroomsXSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsXErrorState(error.toString()));
    });
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
      emit(DateState());
    }
  }

  NoticeModel? noticeModel;

  void AddNotice({
    required studentId,
    required typeId,
    required contentt,
    required date,
  }) {
    emit(
      AddNoticeLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDNOTICE,
      data: {
        'student_id': studentId,
        'type': typeId,
        'content': contentt,
        'date': date,
      },
    ).then((value) {
      print(value?.data);
      noticeModel = NoticeModel.fromJson(value?.data);
      emit(AddNoticeModelState(noticeModel!));
    }).catchError((error) {
      print('Error===> ${error}');
      emit(
        AddNoticeErrorState(error.toString()),
      );
    });
  }

  TextEditingController notes = TextEditingController();

  void showNotesDialog({
    required BuildContext context,
    required studentId,
    required type,

  }) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: MyText(name: "Enter notes", size: 25),
              content: defaultFormField(
                controller: notes,
                label: 'Your Notes',
                type: TextInputType.text,
                validate: (text) =>
                    text!.isEmpty ? 'you must enter note' : null,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      AddNotice(
                        studentId: '$studentId',
                        typeId: type,
                        contentt: notes.text,
                        date:  DateFormat('yyyy-MM-dd').format(selectedDate).toString(),

                      );

                      notes.clear();
                      Navigator.pop(ctx);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                      Colors.white, //change background color of button
                      backgroundColor: kDarkBlue1Color, //change text color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 15.0,
                    ),
                    child: Text("Send")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                      Colors.white, //change background color of button
                      backgroundColor: kDarkBlue1Color, //change text color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 15.0,
                    ),
                    child: Text("Cancel")),
              ],
            ));
  }
}
