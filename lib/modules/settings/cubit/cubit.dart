

import 'package:e_school/modules/settings/cubit/states.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates>{

  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);



  void userLogout ({
    required  token,
})
  {
    emit(SettingsLoadingState());
    DioHelper.getData(
        url: LOGOUT,
        token: token
    ).then((value) {
      print(value?.data);
      emit(SettingsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SettingsErrorState(error.toString()));
    });
  }


}