import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/admin_models.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';
import 'login_owner_state.dart';



class OwnerLoginCubit extends Cubit<OwnerLoginStates> {
  OwnerLoginCubit() : super(OwnerLoginInitialState());
  static OwnerLoginCubit get(context)=>BlocProvider.of(context);
  AdminModel ?admin;
  void adminLogin(
  {
   required String email,
    required String password,

})
  {
    emit(OwnerLoginLoadingState());
    DioHelper.postData(
        url: AdminLogin,
        data: {
          'email':email,
          'password':password,
        }).then((value) {

          print(value?.data);
         admin= AdminModel.fromJson(value?.data);
         print(admin!.data!.accessToken);
         print(admin!.data!.password);

          emit(OwnerLoginSuccessState(admin!));

    }).catchError((error){
      print(error.toString());
      emit(OwnerLoginErrorState(error.toString()));
    });

  }
  IconData suffix= Icons.visibility;
  bool ispassword=true;
  void changepasswordvisibility(){

    ispassword=!ispassword;
    suffix=ispassword? Icons.visibility_off : Icons.visibility;
    emit(OwnerLoginChangePasswordVisibilityState());

  }
}
