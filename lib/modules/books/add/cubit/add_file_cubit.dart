

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:untitled/models/add_file_model.dart';

import 'package:untitled/models/classroom_model.dart';

import 'package:untitled/modules/books/add/cubit/add_file_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddFileCubit extends Cubit<AddFileStates> {
  AddFileCubit() : super(AddFileInitialState());
  static AddFileCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';
  String? dropDownValueSection;
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

// drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    dropDownValueSection='none';
    getClassrooms(dropDownValueClass);
    emit(AddFileClassDropDownButtonState());
  }
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(AddFileSectionDropDownButtonState());
  }

  // bringing classrooms and putting them in their drop down button
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms(value)
  {
    emit(ShowClassroomsFLoadingState());
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
      emit(ShowClassroomsFSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsFErrorState(error.toString()));
    });
  }


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
      allowedExtensions: ['pdf','jpg'], // only allow PDF files
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
    dio.post("http://127.0.0.1:8000/api/upload_file",data: data,
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
