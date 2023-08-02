import 'package:flutter/material.dart';
import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/classrooms/add/cubit/add_classroom_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
class AddClassroomCubit extends Cubit<AddClassroomStates> {
  AddClassroomCubit() : super(AddClassroomInitialState());
  static AddClassroomCubit get(context) => BlocProvider.of(context);

  String? grade;
  List<DropdownMenuItem<String>> GradeItems = [
    DropdownMenuItem(
      value: '7',
      child: Text('Seventh'),
    ),
    DropdownMenuItem(
      value: '8',
      child: Text('Eighth'),
    ),
    DropdownMenuItem(
      value: '9',
      child: Text('Ninth'),
    ),
  ];

  void changeGradeDropDownButton(String gr) {
    grade = gr;
    emit(AddClassroomChangeGradeDropDownButtonState());
  }

  AddClassroomModel? addClassroomModel;
  void AddClassroom(
      {
        required  roomNumber,
        required  capacity,
        required  gradeId,
        required  token,
      }
      )
  {
    emit(
      AddClassroomLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDCLASSROOM,
      data: {
        'room_number': roomNumber,
        'capacity': capacity,
        'grade_id': gradeId,
      },
    ).then((value) {
      print(value?.data);
      addClassroomModel = AddClassroomModel.fromJson(value?.data);
      emit(AddClassroomSuccessState(addClassroomModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        AddClassroomErrorState(error.toString()),
      );
    });


  }
}
