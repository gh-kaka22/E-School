import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_exams_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/notice_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
part 'add_notice_state.dart';

class AddNoticeCubit extends Cubit<AddNoticeState> {
  AddNoticeCubit() : super(AddNoticeInitial());
  static AddNoticeCubit get(context)=> BlocProvider.of(context);
  String? dropDownValueClass = '7';
  String? dropDownValueSection = '1';
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
      child: Text('T1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Mid'),
    ),
  ];
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(SectionDropDownButtonState());
  }
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(AddNoticeType());
  }

  List<TextEditingController> controllers = [];
  AddExamsModel? addExamsModel;
  List<dynamic>? students;
  void getStudents()
  {
    emit(AddNoticeLoadingState());
    DioHelper.getData(
      url: GETSTUDENTS,
      token: token,
    ).then((value) {
      print(value?.data);
      addExamsModel = AddExamsModel.fromJson(value?.data);
      print(addExamsModel?.status);
      print(addExamsModel?.message);
      print(addExamsModel?.data?[0].email);
      students = addExamsModel?.data;
      print(students?[1].religion);
      emit(AddNoticeSuccessState(addExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(AddNoticeErrorState(error.toString()));
    });
  }



  void getStudentByGrade(value)
  {
    emit(AddNoticeLoadingState());
    DioHelper.getData(
      url: '${GETSTUDENTSBYGRADE}/${value}',
      token: token,
    ).then((value) {
      print(value?.data);
      addExamsModel = AddExamsModel.fromJson(value?.data);
      print(addExamsModel?.status);
      print(addExamsModel?.message);
      print(addExamsModel?.data?[0].email);
      students = addExamsModel?.data;
      print(students?[1].religion);
      emit(AddNoticeSuccessState(addExamsModel!));
    }).catchError((error){
      print(error.toString());
      emit(AddNoticeErrorState(error.toString()));
    });
  }

  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms()
  {
    emit(ShowClassroomsXLoadingState());
    DioHelper.getData(
      url: GETCLASSROOMS,
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
        return DropdownMenuItem<dynamic>(
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
  void AddNotice(
      {
        required studentId,
        required type,
        required content,
        required date,

      }
      )
  {
    emit(
      AddNoticeLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: '',
      data: {
        'student_id': studentId,
        'date':date,
        'type':type,
        'content':content,

      },
    ).then((value) {
      print(value?.data);
      noticeModel = NoticeModel.fromJson(value?.data);
      emit(AddNoticeModelState(noticeModel!));
    })
        .catchError((error)
    {
      print(error);
      emit(
        AddNoticeErrorState(error.toString()),
      );
    });


  }


}
