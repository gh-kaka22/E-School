import 'package:bloc/bloc.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';

class SchoolLoginCubit extends Cubit<SchoolLoginStates>{

  SchoolLoginCubit() : super(SchoolLoginInitialState());

  static SchoolLoginCubit get(context) => BlocProvider.of(context);


  LoginModel? loginModel;

  void userLogin ({
    required  deviceToken,
    required  email,
    required  password,
})
  {
    emit(SchoolLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: 
        {
          'email':email,
          'password':password,
          'FCM_token':deviceToken
        }
    ).then((value) {
      print(value?.data);
      loginModel = LoginModel.fromJson(value?.data);
      print(loginModel!.data?.token);
      print(loginModel!.status);
      print(loginModel!.message);
      emit(SchoolLoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(SchoolLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SchoolLoginChangePasswordVisibilityState());

  }

}