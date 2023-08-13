import 'package:e_school/models/home_model.dart';
import 'package:e_school/models/profile_model.dart';
import 'package:e_school/modules/parent_profile/cubit/profile_states.dart';
import 'package:e_school/modules/profile/cubit/profile_states.dart';

import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ParentProfileCubit extends Cubit<ParentProfileStates>{
  ParentProfileCubit() : super(ParentProfileInitialState());
  static ParentProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel ;

  void getParentProfileData()
  {
    emit(ParentProfileLoadingState());
    DioHelper.getData(
        url: 'ParentProfile',
        token: token
    ).then((value) {
      print(value?.data);
      // ParentProfileModel = ParentProfileModel.fromJson(value?.data);
      // print(ParentProfileModel?.data);
      // print(ParentProfileModel?.status);
      // print(ParentProfileModel?.message);
      emit(ParentProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ParentProfileErrorState(error.toString()));
    });



  }
}