import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/class_one_student_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'classrooms_for_student_state.dart';

class ClassroomsForStudentCubit extends Cubit<ClassroomsForStudentState> {
  ClassroomsForStudentCubit() : super(ClassroomsForStudentInitial());
  static ClassroomsForStudentCubit get(context) => BlocProvider.of(context);
  ClassOneStudentModel? classOneStudentModel;


void UpdateClass({
  student_id,
  classroom_id,
}) {
  emit(ClassroomsForStudentLoadingState());
  DioHelper.postData(
    url: CREATCLASSONESTUDENT,
    token: token,
    data: {
      'student_id':student_id,
      'classroom_id':classroom_id,
    },
  ).then((value) {
    print(value?.data);
    if (value!.data['status']) {
      classOneStudentModel = ClassOneStudentModel.fromJson(value.data);
      print(classOneStudentModel?.data);
      emit(ClassroomsForStudentSuccessState(classOneStudentModel!));
    } else {
      emit(ClassroomsForStudentErrorState(value.data['message']));
    }
  }).catchError((error) {
    print("Error ===> ${(error)}");
    emit(
      ClassroomsForStudentErrorState(error.toString()),
    );
  });
}



  void EditClass({
    student_id,
    classroom_id,
  }) {
    emit(ClassroomsForStudentLoadingState());
    DioHelper.postData(
      url: EditCLASSONESTUDENT,
      token: token,
      data: {
        'student_id':student_id,
        'classroom_id':classroom_id,
      },
    ).then((value) {
      print(value?.data);
      if (value!.data['status']) {
        classOneStudentModel = ClassOneStudentModel.fromJson(value.data);
        print(classOneStudentModel?.data);
        emit(ClassroomsForStudentSuccessState(classOneStudentModel!));
      } else {
        emit(ClassroomsForStudentErrorState(value.data['message']));
      }
    }).catchError((error) {
      print("Error ===> ${(error)}");
      emit(
        ClassroomsForStudentErrorState(error.toString()),
      );
    });
  }

}
