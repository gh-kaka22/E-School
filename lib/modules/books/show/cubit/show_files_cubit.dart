import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_file_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/modules/books/show/cubit/show_files_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowFilesCubit extends Cubit<ShowFilesStates> {
  ShowFilesCubit() : super(ShowFilesInitialState());

  static ShowFilesCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection;

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
  List<DropdownMenuItem> menuItems2= [];



  // drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(ShowFilesClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(ShowFilesSectionDropDownButtonState());
  }

  ShowFileModel? showFileModel;
  List<dynamic>? files;

  void getFilesByGradeAndClassroom(grade,classroom)
  {
    emit(ShowFilesLoadingState());
    DioHelper.postData(
      url: SHOWFILE,
      data:{
        'room_number': classroom,
        'grade_id': grade,
      },
      token: token,
    ).then((value) {
      print(value?.data);
      showFileModel = ShowFileModel.fromJson(value?.data);
      print(showFileModel?.status);
      print(showFileModel?.message);
      print(showFileModel?.data[0]);
      files = showFileModel?.data;
      print(files?[1].name);
      emit(ShowFilesSuccessState(showFileModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowFilesErrorState(error.toString()));
    });
  }

  // bringing classrooms and putting them in their drop down button
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsFSLoadingState());
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
      menuItems2 = classrooms!.map((classroom) {
        return DropdownMenuItem<dynamic>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ShowClassroomsFSSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsFSErrorState(error.toString()));
    });
  }






}

