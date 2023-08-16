import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/about_us_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/remote/end_points.dart';

part 'update_school_state.dart';

class UpdateSchoolCubit extends Cubit<UpdateSchoolState> {
  UpdateSchoolCubit() : super(UpdateSchoolInitial());
  static UpdateSchoolCubit get(context) => BlocProvider.of(context);

AboutUsModel? aboutUsModel;
  void getSchoolData(school_id) {
    emit(ShowSchoolInfoLoading());
    DioHelper.getData(
      url: SHOWSCHOOL,
      token: token,
    ).then((value) {
      aboutUsModel = AboutUsModel.fromJson(value!.data);
      print(aboutUsModel!.data!.name);
      emit(ShowSchoolInfoSuccess(aboutUsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowSchoolSchoolError(error));
    });
  }

  void UpdateSchoolData({
   name,
    address,
    phone,
    overview,
  }) {
    emit(UpdateSchoolLoading());
    DioHelper.postData(
      url: UPDATESCHOOL,
      token: token,
      data: {
        'name':name,
        'address':address,
        'phone':phone,
        'overview':overview,
      },
    ).then((value) {
      print(value?.data);
      if (value!.data['status']) {
        aboutUsModel = AboutUsModel.fromJson(value.data);
        print(aboutUsModel?.data);
        emit(UpdateSchoolSuccess(aboutUsModel!));
      } else {
        emit(UpdateSchoolError(value.data['message']));
      }
    }).catchError((error) {
      print("koko ${(error)}");
      emit(
        UpdateSchoolError(error.toString()),
      );
    });
  }
}
