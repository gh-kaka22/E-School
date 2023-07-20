import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/about_us_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_school_state.dart';

class ShowSchoolCubit extends Cubit<ShowSchoolState> {
  ShowSchoolCubit() : super(ShowSchoolInitial());
  static ShowSchoolCubit get(context) => BlocProvider.of(context);
  AboutUsModel? aboutUsModel;
  void getSchool(school_id) {
    emit(ShowSchoolLoadingState());
    DioHelper.getData(
      url: SHOWSCHOOL,
      token: token,
    ).then((value) {
      aboutUsModel = AboutUsModel.fromJson(value!.data);
      print(aboutUsModel!.data!.name);
      emit(ShowSchoolSuccessState(aboutUsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowSchoolErrorState(error.toString()));
    });
  }


}
