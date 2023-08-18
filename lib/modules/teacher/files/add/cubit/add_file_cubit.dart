

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_school/models/add_file_model.dart';
import 'package:e_school/models/classroom_model.dart';
import 'package:e_school/models/teacher_home_model.dart';
import 'package:e_school/modules/teacher/files/add/cubit/add_file_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';





import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/network/remote/dio_helper.dart';


class AddFileCubit extends Cubit<AddFileStates> {
  AddFileCubit() : super(AddFileInitialState());
  static AddFileCubit get(context) => BlocProvider.of(context);


  String? dropDownValueSection;

  List<DropdownMenuItem> menuItemsSection = [];
  String? dropDownValueClassroom;

  List<DropdownMenuItem> menuItemsClassroom = [];

// drop down buttons changing method

  void changeSectionDropDownButton( newValue)
  {
    dropDownValueSection = newValue;
    emit(AddFileSectionDropDownButtonState());
  }
  void changeClassRoomDropDownButton( newValue)
  {
    dropDownValueClassroom = newValue;
    emit(AddFileClassDropDownButtonState());
  }
  // bringing classrooms and putting them in their drop down button
  List<dynamic>? classrooms;
  TeacherHomeModel? teacherHomeModel;
  void getClassrooms()
  {
    emit(RoomNumberFLoadingState());
    DioHelper.getData(
      url: TEACHERHOME,
      token: token,
    ).then((value) {
      print(value?.data);
      teacherHomeModel = TeacherHomeModel.fromJson(value?.data);
      classrooms = teacherHomeModel!.data.classes;
      print(classrooms);
      menuItemsSection = classrooms!.map((classroom) {
        return DropdownMenuItem<dynamic>(
          value: classroom.roomNumber,
          child: Text(classroom.roomNumber),

        );

      }).toList();

      emit(RoomNumberFSuccessState(teacherHomeModel!));
    }).catchError((error){
      print(error.toString());
      emit(RoomNumberFErrorState(error.toString()));
    });
  }

//=====================================================================
  List<dynamic>? grades;
  void getGrades()
  {
    emit(ShowClassroomsFLoadingState());
    DioHelper.getData(
      url: TEACHERHOME,
      token: token,
    ).then((value) {
      print(value?.data);
      teacherHomeModel = TeacherHomeModel.fromJson(value?.data);
      grades = teacherHomeModel!.data.classes;
      print(grades);
      menuItemsClassroom = grades!.map((grade) {
        return DropdownMenuItem<dynamic>(
          value: '${grade.gradeId}',
          child: Text('${grade.gradeId}'),

        );

      }).toList();

      emit(ShowClassroomsFSuccessState(teacherHomeModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsFErrorState(error.toString()));
    });
  }
//======================================================================
  AddFileModel? addFileModel;

  File? selectedFile;
  String? fileName;
  String? filePath;
  FormData? data;
  // function to handle file selection
  Future<void> selectFile() async {
    emit(AddFileUploadLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','jpg','png'],
    );
    if (result != null) {
      selectedFile = File(result.files.single.path ?? "");
      print(selectedFile?.path);
      fileName = selectedFile!.path.split(r'\').last;
      filePath = selectedFile!.path;
      emit(AddFileUploadSuccessState());
    } else {
      emit(AddFileUploadErrorState("No file selected"));
    }
  }
//function to handle sending the selected file
 Future sendFile({
    required filePath,
   required fileName,
   required name,
   required gradeId,
   required roomNumber,
})async{
    emit(AddFileLoadingState());
    FormData data = FormData.fromMap({
      'name' : name,
      'room_number':roomNumber,
      'grade_id': gradeId,
      'pdf_file': await MultipartFile.fromFile(filePath,filename: fileName)
    });
    var dio=Dio();
    dio.post("${baseUrl}api/upload_file",data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        onSendProgress: (int sent,int total){
          print('$sent $total');
        }).then((value) {
      print(value.data);
      addFileModel = AddFileModel.fromJson(value.data);
      print(addFileModel!.data.path);
      emit(AddFileSuccessState(addFileModel!));
        }).catchError((error) {
      print(error);
      emit(
        AddFileErrorState(error.toString()),
      );
    });

 }


}
