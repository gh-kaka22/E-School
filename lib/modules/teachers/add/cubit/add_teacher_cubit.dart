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
  String? dropDownValueSubject='none';
  List<DropdownMenuItem> menuItemsSubject = [];
  List<dynamic>? classRoom=[];
  List<dynamic>? classId=[];
  int? subjectId;
  


  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
    subjectId = menuItemsSubject.indexWhere((item) => item.value == newValue);
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
        return MultiSelectItem(classroom.classroomId, classroom.roomNumber);
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

  void AddTeacher(
      {
        required String first_name,
        required String last_name,
        required String phone_number,
       // required String urgent_phone_number,
        required String address,
        required subjectId,
        required classrooms,
      }
      )
  {
    emit(
      AddTeacherLoading(),
    );
    DioHelper.postData(
      url: ADDTEACHER,
      token: token,
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'address': address,
        'subject_id': subjectId,
        //'urgent_phone_number':urgent_phone_number,
        'classrooms':classrooms,
      },
    ).then((value) {
      if (value!.data['status']) {

      teacher = TeacherModel.fromJson(value.data);
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


}

