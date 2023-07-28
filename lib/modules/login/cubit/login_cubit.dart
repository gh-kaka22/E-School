

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/admin_models.dart';
import 'package:untitled/models/login_model.dart';
import 'package:untitled/modules/admin/login/cubit/login_state.dart';
import 'package:untitled/modules/login/cubit/login_state.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  LoginModel? loginModel;
  void Login(
      {
        required String email,
        required String password,

      })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        token: token,
        data: {
          'email':email,
          'password':password,
        }).then((value) {

      print(value?.data);
      loginModel= LoginModel.fromJson(value?.data);
      print(loginModel!.data.firstName);
      print(loginModel!.data.lastName);

      emit(LoginSuccessState(loginModel!));

    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });

  }
  IconData suffix= Icons.visibility;
  bool ispassword=true;
  void changepasswordvisibility(){

    ispassword=!ispassword;
    suffix=ispassword? Icons.visibility_off : Icons.visibility;
    emit(LoginChangePasswordVisibilityState());

  }
}
