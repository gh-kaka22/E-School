import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/models/teacher_model.dart';
import 'package:untitled/shared/components/constants.dart';

import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'add_teacher_state.dart';

class AddTeacherCubit extends Cubit<AddTeacherState> {
  AddTeacherCubit() : super(AddTeacherInitial());
  static AddTeacherCubit get(context) => BlocProvider.of(context);
  TeacherModel? teacher;
  String? sub;
  bool? checkBox=false;
  int? ischeck;
  String? dropDownValueSubject='none';
  List<DropdownMenuItem> menuItemsSubject = [];
  List<dynamic>? classRoom=[];
  List<dynamic>? classId=[];


  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
    emit(SubjectDropDownButtonState());
  }

  ///bringing classrooms and putting them in a multi select dialog
  List<MultiSelectItem<dynamic>> items = [];

  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms()
  {
    emit(ClassRoomLoadingState());
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
      items = classrooms!.map((classroom) {
        return MultiSelectItem(classroom, classroom.roomNumber);
      }).toList();
      emit(ClassRoomSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ClassroomsErrorState(error.toString()));
    });
  }

  /// bringing subjects and putting them in their drop down button
  SubjectModel? subjectModel;
  List<dynamic>? subjects;
  void getSubjects()
  {
    emit(ShowSubjectsTRLoadingState());
    DioHelper.getData(
      url: GETSUBJECTS,
      token: token,
    ).then((value) {
      print(value?.data);
      subjectModel = SubjectModel.fromJson(value?.data);
      print(subjectModel?.status);
      print(subjectModel?.message);
      print(subjectModel?.data?[0].name);
      subjects = subjectModel?.data;
      print(subjects?[1].name);
      menuItemsSubject = subjects!.map((subject) {
        return DropdownMenuItem<dynamic>(
          value: subject.name,
          child: Text(subject.name),
        );
      }).toList();
      emit(ShowSubjectsTRSuccessState(subjectModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSubjectsTRErrorState(error.toString()));
    });
  }




  // void getClassRoom(){
  //   emit(AddTeacherLoading());
  //   DioHelper.getData(
  //     url: GETCLASSROOMS,
  //     token: token,
  //   ).then((value) {
  //     print(value?.data);
  //     classroomModel = ClassroomModel.fromJson(value?.data);
  //     print(classroomModel?.status);
  //     print(classroomModel?.message);
  //     print(classroomModel?.data?[0].roomNumber);
  //     classRoom = classroomModel?.data;
  //     print(classRoom?[1]);
  //     emit(ClassRoomSuccessState(classroomModel!));
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(ClassroomsErrorState(error.toString()));
  //   });
  //
  // }

  // changeCheck(bool val, int classroomId) {
  //   print('Maysaaaaaaaaa : $val , $classroomId');
  //   ischeck = val ? 1 : 0;
  //   if (val) {
  //     ischeck = 1;
  //     classId!.add(classroomId);
  //   } else {
  //     ischeck = 0;
  //     classId?.remove(classroomId);
  //   }
  //   print('ischeck= ${ischeck}');
  //   emit(CheckClassRoomState());
  //   print(classroomId);
  // }

  void AddTeacher(
      {
        required String first_name,
        required String last_name,
        required String phone_number,
        required String urgent_phone_number,
        required String address,
        required subject,
        required classroom,
      }
      )
  {
    emit(
      AddTeacherLoading(),
    );
    DioHelper.postData(
      url: 'teacher/register',
      token: token,
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'address': address,
        'subject_id': subID.toString(),
        'urgent_phone_number':urgent_phone_number,
        'classrooms':[1],
      },
    ).then((value) {
      if (value!.data['status']) {

      teacher = TeacherModel.fromJson(value?.data);
      print(teacher?.data);
      emit(AddTeacherSuccess(teacher!));
      }
      else {
        emit(AddTeacherError(value.data['message']));
      }
    })
        .catchError((error) {
      print("momo ${error.toString()}");
      emit(
        AddTeacherError(error.toString()),

      );

    });


  }

  List<DropdownMenuItem<String>> Subject = [
    DropdownMenuItem(
      value: 'Math',
      child: Text('Math'),
    ),
    DropdownMenuItem(
      value: 'Arabic',
      child: Text('Arabic'),
    ),
    DropdownMenuItem(
      value: 'Scince',
      child: Text('Scince'),
    ),
    DropdownMenuItem(
      value: 'Physics',
      child: Text('Physics'),
    ),
    DropdownMenuItem(
      value: 'Chemistry',
      child: Text('Chemistry'),
    ),
    DropdownMenuItem(
      value: 'English',
      child: Text('English'),
    ),
    DropdownMenuItem(
      value: 'French',
      child: Text('French'),
    ),

  ];
  int? subID;
  void changeDropDownButton(String newValue) {
    sub = newValue;
    print('${Subject}');
    if(sub=='Math')
      subID=1;
    if(sub=='Arabic')
      subID=2;
    if(sub=='Scince')
      subID=3;
    if(sub=='Physics')
      subID=4;
    if(sub=='Chemistry')
      subID=5;
    if(sub=='English')
      subID=6;
    if(sub=='French')
      subID=7;
    print(subID);

    emit(SubjectState());
  }
}

