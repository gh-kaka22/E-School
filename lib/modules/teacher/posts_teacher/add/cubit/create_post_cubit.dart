import 'package:e_school/models/classroom_model.dart';
import 'package:e_school/models/create_post_model.dart';
import 'package:e_school/models/teacher_home_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_post_states.dart';

class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit() : super(CreatePostInitialState());
  static CreatePostCubit get(context) => BlocProvider.of(context);


  ///DROPDOWNS
  //CLASSROOMS
  int? dropDownValueSection;
  List<DropdownMenuItem<dynamic>> menuItemsSection = [];
  void changeSectionDropDownButton(int newValue)
  {
    dropDownValueSection = newValue;

    emit(CreatePostChangeGradeDropDownButtonState());
  }
  List<dynamic>? classrooms;
  TeacherHomeModel? teacherHomeModel;
  void getClassrooms()
  {
    emit(ShowClassroomsPLoadingState());
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
          value: classroom.classroomId,
          child: Text(classroom.roomNumber),

        );

      }).toList();

      emit(ShowClassroomsPSuccessState(teacherHomeModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowClassroomsPErrorState(error.toString()));
    });
  }
///CREATING POST
  CreatePostModel? createPostModel;

  void CreatePostByTeacher(
      {
        required  body,
        required  classroomId,
      }
      )
  {
    emit(
      CreatePostLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: CREATETEACHERPOST,
      data: {
        'body': body,
        'classroom_id':classroomId,

      },
    ).then((value) {
      print(value?.data);
      createPostModel = CreatePostModel.fromJson(value?.data);
      emit(CreatePostSuccessState(createPostModel!));
    })
        .catchError((error) {
      print("momo ${error.toString()}");
      emit(
        CreatePostErrorState(error.toString()),
      );
    });


  }

}
