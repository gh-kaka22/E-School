import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/classroom_model.dart';
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
  List<dynamic>? classRoom=[];
  List<dynamic>? classId=[];
  List<DropdownMenuItem> menuItemsSection = [];
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ClassRoomLoadingState());
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
        return DropdownMenuItem<dynamic>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ClassRoomSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ClassroomsErrorState(error.toString()));
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

