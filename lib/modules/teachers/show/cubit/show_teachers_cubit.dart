import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/show_teacher_model.dart';
import 'package:untitled/models/teacher_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_teachers_state.dart';

class ShowTeachersCubit extends Cubit<ShowTeachersState> {
  ShowTeachersCubit() : super(ShowTeachersInitial());
  static ShowTeachersCubit get(context) => BlocProvider.of(context);
  ShowTeacherModel? showTeacherModel;
  List<dynamic>? teachers;
  void getTeachers()
  {
    emit(ShowTeachersLoadingState());
    DioHelper.getData(
      url: SHOWTEACHERS,
      token: token,
    ).then((value) {
      print(value?.data);
      showTeacherModel = ShowTeacherModel.fromJson(value?.data);
      print(showTeacherModel?.status);
      print(showTeacherModel?.message);
      teachers = showTeacherModel?.data;
      emit(ShowTeachersSuccessState(showTeacherModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowTeachersErrorState(error.toString()));
    });
  }

}
