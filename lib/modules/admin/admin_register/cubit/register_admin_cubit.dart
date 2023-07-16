import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_admin_model.dart';
import 'package:untitled/models/admin_models.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'register_admin_state.dart';

class RegisterAdminCubit extends Cubit<RegisterAdminState> {
  RegisterAdminCubit() : super(RegisterAdminInitial());
  static RegisterAdminCubit get(context)=> BlocProvider.of(context);
  AddAdminModel ?addAdminModel;
  void adminRegister(
      {
        required String fname,
        required String lname,

      })
  {
    emit(RegisterAdminLoadingState());
    DioHelper.postData(
        url: ADDADMIN,
        token: token,
        data: {
          'first_name':fname,
          'last_name':lname,
        }).then((value) {

      print(value?.data);
      addAdminModel= AddAdminModel.fromJson(value?.data);
      print(addAdminModel!.data!.token);
      print(addAdminModel!.data!.passwordDecoded);

      emit(RegisterAdminSuccessgState(addAdminModel!));

    }).catchError((error){
      print('mmmmmmmmmmmmmmmm${error}');
      print(error.toString());
      emit(RegisterAdminErrorState(error.toString()));
    });

  }


}
