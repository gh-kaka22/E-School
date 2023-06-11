import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/admin_models.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'register_admin_state.dart';

class RegisterAdminCubit extends Cubit<RegisterAdminState> {
  RegisterAdminCubit() : super(RegisterAdminInitial());
  static RegisterAdminCubit get(context)=> BlocProvider.of(context);
  AdminModel ?admin;
  void adminRegister(
      {
        required String fname,
        required String lname,

      })
  {
    emit(RegisterAdminLoadingState());
    DioHelper.postData(
        url: AdminLogin,
        data: {
          'first_name':fname,
          'last_name':lname,
        }).then((value) {

      print(value?.data);
      admin= AdminModel.fromJson(value?.data);
      print(admin!.data!.accessToken);
      print(admin!.data!.password);

      emit(RegisterAdminSuccessgState(admin!));

    }).catchError((error){
      print(error.toString());
      emit(RegisterAdminErrorState(error.toString()));
    });

  }
  IconData suffix= Icons.visibility;
  bool ispassword=true;
  void changepasswordvisibility(){

    ispassword=!ispassword;
    suffix=ispassword? Icons.visibility_off : Icons.visibility;
    emit(RegisterChangePasswordVisibilityState());

  }
}
