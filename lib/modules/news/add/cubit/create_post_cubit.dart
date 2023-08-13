



import 'package:flutter/material.dart';
import 'package:untitled/models/add_classroom_model.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/create_post_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

import 'create_post_states.dart';

class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit() : super(CreatePostInitialState());
  static CreatePostCubit get(context) => BlocProvider.of(context);

  ///CHECK BUTTONS
  bool isCheckedGeneral = true;

  changeCheck(val) {
    isCheckedGeneral = val!;
    isCheckedGrade = false;
    isCheckedClassroom=false;
    emit(CheckBoxState());
  }

  bool isCheckedGrade = false;

  changeCheckGrade(val) {
    isCheckedGrade = val!;
    isCheckedGeneral=false;
    isCheckedClassroom=false;
    emit(CheckBoxState());
  }

  bool isCheckedClassroom = false;

  changeCheckClassroom(val) {
    isCheckedClassroom = val!;
    isCheckedGeneral=false;
    isCheckedGrade=false;
    emit(CheckBoxState());
  }

  ///DROPDOWNS
  //GRADES
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

  void changeGradeDropDownButton(String value) {
    grade = value;
    emit(CreatePostChangeGradeDropDownButtonState());
  }
  //CLASSROOMS
  String? dropDownValueSection;
  List<DropdownMenuItem<String>> menuItemsSection = [];
  void changeSectionDropDownButton(String newValue)
  {
    dropDownValueSection = newValue;
    emit(CreatePostChangeGradeDropDownButtonState());
  }
  ClassroomModel? classroomModel;
  List<dynamic>? classrooms;
  void getClassrooms()
  {
    emit(ShowClassroomsPLoadingState());
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
      menuItemsSection = classrooms!.map((classroom) {
        return DropdownMenuItem<String>(
          value: '${classroom.classroomId}',
          child: Text(classroom.roomNumber),
        );
      }).toList();
      emit(ShowClassroomsPSuccessState(classroomModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsPErrorState(error.toString()));
    });
  }
///CREATING POST
  CreatePostModel? createPostModel;
  //SCHOOL
  void CreatePostSchool(
      {
        required  body,
        required  token,
      }
      )
  {
    emit(
      CreatePostLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: CREATESCHOOLPOST,
      data: {
        'body': body,
      },
    ).then((value) {
      print(value?.data);
      createPostModel = CreatePostModel.fromJson(value?.data);
      emit(CreatePostSuccessState(createPostModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        CreatePostErrorState(error.toString()),
      );
    });


  }
  //GRADE
  void CreatePostGrade(
      {
        required  body,
        required  gradeId,
        required  token,
      }
      )
  {
    emit(
      CreatePostLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: CREATEGRADEPOST,
      data: {
        'body': body,
        'grade_id':gradeId
      },
    ).then((value) {
      print(value?.data);
      createPostModel = CreatePostModel.fromJson(value?.data);
      emit(CreatePostSuccessState(createPostModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        CreatePostErrorState(error.toString()),
      );
    });


  }
  //CLASSROOM
  void CreatePostClassroom(
      {
        required  body,
        required  classroomId,
        required  token,
      }
      )
  {
    emit(
      CreatePostLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: CREATECLASSROOMPOST,
      data: {
        'body': body,
        'classroom_id':classroomId
      },
    ).then((value) {
      print(value?.data);
      createPostModel = CreatePostModel.fromJson(value?.data);
      emit(CreatePostSuccessState(createPostModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        CreatePostErrorState(error.toString()),
      );
    });


  }
}
