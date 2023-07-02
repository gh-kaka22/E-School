import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/admin_models.dart';
import 'package:untitled/modules/admin/login/cubit/login_state.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AdminLoginCubit extends Cubit<AdminLoginStates> {
  AdminLoginCubit() : super(AdminLoginInitialState());
  static AdminLoginCubit get(context)=>BlocProvider.of(context);
  AdminModel ?admin;
  void adminLogin(
      {
        required String email,
        required String password,

      })
  {
    emit(AdminLoginLoadingState());
    DioHelper.postData(
        url: AdminLogin,
        token: token,
        data: {
          'email':email,
          'password':password,
        }).then((value) {

      print(value?.data);
      admin= AdminModel.fromJson(value?.data);
      print(admin!.data!.accessToken);
      print(admin!.data!.password);

      emit(AdminLoginSuccessState(admin!));

    }).catchError((error){
      print(error.toString());
      emit(AdminLoginErrorState(error.toString()));
    });

  }
  IconData suffix= Icons.visibility;
  bool ispassword=true;
  void changepasswordvisibility(){

    ispassword=!ispassword;
    suffix=ispassword? Icons.visibility_off : Icons.visibility;
    emit(AdminLoginChangePasswordVisibilityState());

  }
}
