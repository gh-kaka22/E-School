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
      token:token ,
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
