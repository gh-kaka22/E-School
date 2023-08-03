import 'dart:io';
import 'package:cubit_form/cubit_form.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/exams_schedule_model.dart';
import 'package:untitled/shared/components/constants.dart';
part 'add_exams_schedule_state.dart';
class AddExamsScheduleCubit extends Cubit<AddExamsScheduleState> {
  AddExamsScheduleCubit() : super(AddExamsScheduleInitial());
  static AddExamsScheduleCubit get(context) => BlocProvider.of(context);
  String? grade;
  String? dropDownValueType;
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
  List<DropdownMenuItem<String>> menuItemsType = [
    DropdownMenuItem(
      value: '1',
      child: Text('T1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Mid'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('T2'),
    ),
    DropdownMenuItem(
      value: '4',
      child: Text('Final'),
    ),
  ];

  void changeGradeDropDownButton(value)
  {
    grade = value;
    emit(GradechangeDropDownButton());
  }
  void changeTypeDropDownButton(String newValue)
  {
    dropDownValueType = newValue;
    emit(TypechangeDropDownButton());
  }
  File? selectedFile;
  String? filePath;
  String? fileName;
  FormData? data;
  ExamScheduleModel? examScheduleModel;
      Future AddExamSchedule({
        required typeId,
        required schoolYear,
        required gradeId,
        required filePath,
        required fileName,

      }) async {
        emit(
          AddExamsScheduleLoadingState(),);
        FormData data = FormData.fromMap({
          'type_id' : typeId,
          'grade_id':gradeId,
          'School_Year': schoolYear,
          'image': await MultipartFile.fromFile(filePath,filename: fileName)
        });
        var dio=Dio();
        dio.post("http://127.0.0.1:8000/api/exams_schedule/create",data: data,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',

              },

            ),

            onSendProgress: (int sent,int total){
              print('$sent $total');
            }).then((value) {
          print(value.data);
          examScheduleModel = ExamScheduleModel.fromJson(value.data);
          print(examScheduleModel!.data!.image);
          emit(AddExamsScheduleSuccessState(examScheduleModel!));
        }).catchError((error) {
          print(error);
          emit(
            AddExamsScheduleErrorState(error.toString()),
          );
        });

      }

  Future<void> selectImage() async {
    emit(SelectLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','jpg','png'],
    );
    if (result != null) {
      selectedFile = File(result.files.single.path ?? "");
      print(selectedFile?.path);
      fileName = selectedFile!.path.split(r'\').last;
      filePath = selectedFile!.path;
      emit(SelectSuccessState());
    } else {
      emit(SelectErrorState("No Image selected"));
    }
  }
    }


