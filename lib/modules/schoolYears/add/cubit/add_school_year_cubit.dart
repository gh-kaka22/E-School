



import 'package:untitled/models/add_school_year_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/schoolYears/add/cubit/add_school_year_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddSchoolYearCubit extends Cubit<AddSchoolYearStates> {
  AddSchoolYearCubit() : super(AddSchoolYearInitialState());
  static AddSchoolYearCubit get(context) => BlocProvider.of(context);

  AddSchoolYearModel? addSchoolYearModel;
  void AddSchoolYear(
      {
        required name,
        required token,
      }
      )
  {
    emit(
      AddSchoolYearLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDSCHOOLYEAR,
      data: {
        'name': name,
      },
    ).then((value) {
      print(value?.data);
      addSchoolYearModel = AddSchoolYearModel.fromJson(value?.data);
      emit(AddSchoolYearSuccessState(addSchoolYearModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        AddSchoolYearErrorState(error.toString()),
      );
    });


  }
}
