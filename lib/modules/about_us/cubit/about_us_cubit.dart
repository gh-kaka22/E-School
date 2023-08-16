
import 'package:e_school/models/about_us_model.dart';
import 'package:e_school/modules/about_us/cubit/about_us_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());
  static AboutUsCubit get(context) => BlocProvider.of(context);
  AboutUsModel? aboutUsModel;
  void getSchool() {
    emit(AboutUsLoadingState());
    DioHelper.getData(
      url: SHOWSCHOOL,
      token: token,
    ).then((value) {
      aboutUsModel = AboutUsModel.fromJson(value!.data);
      print(aboutUsModel!.data!.name);
      emit(AboutUsSuccessState(aboutUsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AboutUsErrorState(error.toString()));
    });
  }


}
