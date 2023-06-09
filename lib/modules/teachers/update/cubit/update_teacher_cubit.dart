import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/teacher_model.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'update_teacher_state.dart';

class UpdateTeacherCubit extends Cubit<UpdateTeacherState> {
  UpdateTeacherCubit() : super(UpdateTeacherInitial());
  static UpdateTeacherCubit get(context) => BlocProvider.of(context);
  TeacherModel? teacherModel;
  void getTeacherData()
  {
    emit(TeacherDataLoading());
    DioHelper.getData(url:UPDATETEACHER,
    token:token ,
    ).
    then((value) {
      teacherModel = TeacherModel.fromJson(value!.data);
      print(teacherModel!.data!.firstName);
      emit(TeacherDataSuccess(teacherModel!));

    }
    ).catchError((error){
      print(error.toString());
      emit(TeacherDataError());
    });

  }
  void UpdateTeacherData({
    required String firstname,
    required String lastname,
    required String phonenumber,
    required String address,
    required String subjectId,


}){
    emit(UpdateTeacherDataLoading());
    DioHelper.postData(
      url:UPDATETEACHER,
      token:token ,
      data:
      {
        'firstname': firstname,
        'lastename':lastname,
        'phonenumber':phonenumber,
        'address':address,
        'subjectId':subjectId,
      },
    ).
    then((value) {
      teacherModel = TeacherModel.fromJson(value!.data);
      print(teacherModel!.data!.firstName);
      emit(UpdateTeacherDataSuccess(teacherModel!));

    }
    ).catchError((error){
      print(error.toString());
      emit(UpdateTeacherDataError());
    });

  }
}
