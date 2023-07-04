import 'package:e_school/models/home_model.dart';
import 'package:e_school/models/profile_model.dart';
import 'package:e_school/modules/profile/cubit/profile_states.dart';

import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel ;

  void getProfileData()
  {
    emit(ProfileLoadingState());
    DioHelper.getData(
        url: PROFILE,
        token: token
    ).then((value) {
      print(value?.data);
      profileModel = ProfileModel.fromJson(value?.data);
      print(profileModel?.data);
      print(profileModel?.status);
      print(profileModel?.message);
      emit(ProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ProfileErrorState(error.toString()));
    });



  }
}