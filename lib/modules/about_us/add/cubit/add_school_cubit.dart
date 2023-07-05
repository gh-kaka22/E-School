import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/about_us_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'add_school_state.dart';

class AddSchoolCubit extends Cubit<AddSchoolState> {
  AddSchoolCubit() : super(AddSchoolInitial());
  static AddSchoolCubit get(context)=> BlocProvider.of(context);
  AboutUsModel? aboutUsModel;
  void AddInformationSchool({
    required name,
    required address,
    required phone,
    required overview,

})
  {
    emit(AddSchoolLoadingState());
    DioHelper.postData(
        url: ADDSCHOOL,
        token: token,
        data:{
          'name':name,
          'address':address,
          'phone':phone,
          'overview':overview,


        }).then((value) {
          print(value?.data);
          aboutUsModel=AboutUsModel.fromJson(value?.data);
          print(aboutUsModel!.data!.name);
          emit(AddSchoolSuccessgState(aboutUsModel!));
    }).catchError((error){
      print('Error==> $error');
      emit(AddSchoolErrorState(error.toString()));
    });

  }
}
