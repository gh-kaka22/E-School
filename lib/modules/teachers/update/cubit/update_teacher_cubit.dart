import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/models/update_teacher_model.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/end_points.dart';
part 'update_teacher_state.dart';

class UpdateTeacherCubit extends Cubit<UpdateTeacherState> {
  UpdateTeacherCubit() : super(UpdateTeacherInitial());
  static UpdateTeacherCubit get(context) => BlocProvider.of(context);
  UpdateTeacherModel? updateTeacherModel;
  String? dropDownValueSubject='none';
  void getTeacherData(value)
  {
    emit(ShowTeacherDataLoading());
    DioHelper.getData(
      url:'teacher/${1}',
      token:token ,
    ).then((value) {
      updateTeacherModel = UpdateTeacherModel.fromJson(value!.data);
      print(updateTeacherModel!.data!.firstName);
      print(updateTeacherModel!.data!.phoneNumber);
      emit(ShowTeacherDataSuccess(updateTeacherModel!));

    }
    ).catchError((error){
      print(error.toString());
      emit(ShowTeacherDataError(error.toString()));
    });

  }
  void UpdateTeacherData({
      firstname,
      lastname,
      phonenumber,
      address,
      subject,
    classroom,
  }){
    emit(UpdateTeacherDataLoading());
    DioHelper.postData(
      url: '${UPDATETEACHER}/${1}',
      token:token ,
      data:
      {
        'firstname': firstname,
        'lastename':lastname,
        'phonenumber':phonenumber,
        'address':address,
        'subject_id':subject,
        'classrooms':classroom,

      },
    ).then((value) {
      print(value?.data);
      if (value!.data['status']) {
        updateTeacherModel = UpdateTeacherModel.fromJson(value.data);
        print(updateTeacherModel!.data!.firstName);
        emit(UpdateTeacherDataSuccess(updateTeacherModel!));
      }else{
        emit(UpdateTeacherDataError(value.data['message']));
      }
    }
    ).catchError((error){
      print(error.toString());
      emit(UpdateTeacherDataError(error.toString()));
    });

  }

  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  List<MultiSelectItem<dynamic>> items = [];
  void getClassrooms()
  {
    emit(TClassRoomLoading());
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

      emit(TClassRoomSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(TClassRoomErrorState(error.toString()));
    });
  }
  SubjectModel? subjectModel;
  List<dynamic>? subjects;
  List<DropdownMenuItem> menuItemsSubject = [];
  void getSubjects()
  {
    emit(ShowSubjectsLoadingState());
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
      emit(ShowSubjectsSuccessState(subjectModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowSubjectsErrorState(error.toString()));
    });
  }
  int? subjectId;
  void changeSubjectDropDownButton(String newValue)
  {
    dropDownValueSubject = newValue;
 //   subjectId = menuItemsSubject.indexWhere((item) => item.value == newValue);
    emit(SubjectDropDownButtonState());


  }



}
