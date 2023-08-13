import 'package:bloc/bloc.dart';
import 'package:e_school/models/teacher_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_teacher_state.dart';

class ProfileTeacherCubit extends Cubit<ProfileTeacherState> {
  ProfileTeacherCubit() : super(ProfileTeacherInitial());
  static ProfileTeacherCubit get(context) => BlocProvider.of(context);
  ProfileTeacher? profileTeacher;
  void getTeacherProfile()
  {
    emit(ProfileTeacherLoadingState());
    DioHelper.getData(
      url:TEACHERPROFILE,
      token:'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDg0MTk3ZWI2MWYzMmYxN2VmNzU1MWM5YmZmYjJjODgwMmNmYTEyMDg3NWRjYTVjYmI1MzczMGQ1MjUwYzM2NTk2YWIwM2NiMzI0ZjhhZmMiLCJpYXQiOjE2OTAwNDI1NjEuNzQxMzY2LCJuYmYiOjE2OTAwNDI1NjEuNzQxMzc1LCJleHAiOjE3MjE2NjQ5NjEuNzIxNjI3LCJzdWIiOiIxMSIsInNjb3BlcyI6W119.CXzbA42laQv1lNWtk7FtlNQ8B6zAg7yE1sHcQnsKKBNmxUws5rGMt0PXvhcgdh_1ofHvYT3aq2oH4vegfH_pqCI4a9W8tNS6QjAYIeyuk1NFlFKQnfLnNnWxypwnJ4vGM0cTMpX_bQn-xwtRDFnD8MuOfV17d7rL0LCLEPrZnosT_m9fffA4sDmzYYeWvUPnxymEd0dR3j2PAblh_a_OiZkZrgUSULZkXAFzJgcNpSsDnQ5lHejITuyVds6fA4bcX8y-ilbS42tF0J97oxK-hZj35giu2FtXBnQFZc92g9LozPHmyc_o0MqehjDEknR2VrwOIqQ3pTtQrE3RwJZnfPLYhC22RAX7oOa1F6QI241liBR6ziWm3a3tAvBG1iEbmieh5S-qytaauP3CsR9U7pxeo4ikmXxPoG0-ipsYqr-DVyYMxKw-1e6RE7dxovRUnS-RxA0CIAIH1iLW1z8jbklAOeQJhApBhCxyKzTI0QbViD-MEZfvyu4pZLjixmQ1IhTGaAg0SNrfOhrTJdyuwaCN1a4dO6Okr3OHpEKCAXUoNIw02uEKAGkxJtQ_VHD5F6wvjiODINw_t5iBNn8P6MkScr8i3D2ilNqzIlshxp9yvjvdQMh27P7J9twh6AcGnVLcyXyANhSksikrjqvePFPy_GMf7yIdS89v4TVBBuo' ,
    ).then((value) {
      profileTeacher = ProfileTeacher.fromJson(value!.data);
      print(profileTeacher!.data!.firstName);
      print(profileTeacher!.data!.subjectName);
      emit(ProfileTeacherSuccessState(profileTeacher!));

    }
    ).catchError((error){
      print(error.toString());
      emit(ProfileTeacherErrorState(error.toString()));
    });

  }
}
