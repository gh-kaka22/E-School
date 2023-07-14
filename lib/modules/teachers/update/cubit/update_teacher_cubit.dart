import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/update_teacher_model.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'update_teacher_state.dart';

class UpdateTeacherCubit extends Cubit<UpdateTeacherState> {
  UpdateTeacherCubit() : super(UpdateTeacherInitial());
  static UpdateTeacherCubit get(context) => BlocProvider.of(context);
  UpdateTeacherModel? updateTeacherModel;
  void getTeacherData(value)
  {
    emit(ShowTeacherDataLoading());
    DioHelper.getData(
      url:'teacher/${1}',
      token:token ,
    ).then((value) {
      updateTeacherModel = UpdateTeacherModel.fromJson(value!.data);
      print(updateTeacherModel!.data!.firstName);
      print(updateTeacherModel!.data!.phoneNumber);
      emit(ShowTeacherDataSuccess(updateTeacherModel!));

    }
    ).catchError((error){
      print(error.toString());
      emit(ShowTeacherDataError(error.toString()));
    });

  }
  void UpdateTeacherData({
      firstname,
      lastname,
      phonenumber,
      address,
      subject,
      section,
  }){
    emit(UpdateTeacherDataLoading());
    DioHelper.postData(
      url: '${UPDATETEACHER}/${1}',
      token:token ,
      data:
      {
        'firstname': firstname,
        'lastename':lastname,
        'phonenumber':phonenumber,
        'address':address,
   //todo: add section and subject
      },
    ).then((value) {
      print(value?.data);
      if (value!.data['status']) {
        updateTeacherModel = UpdateTeacherModel.fromJson(value.data);
        print(updateTeacherModel!.data!.firstName);
        emit(UpdateTeacherDataSuccess(updateTeacherModel!));
      }else{
        emit(UpdateTeacherDataError(value.data['message']));
      }
    }
    ).catchError((error){
      print(error.toString());
      emit(UpdateTeacherDataError(error.toString()));
    });

  }
}
