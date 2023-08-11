



import 'package:untitled/models/add_school_year_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/schoolYears/add/cubit/add_school_year_states.dart';
import 'package:untitled/modules/settings/reset_password/cubit/reset_password_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  void ResetPassword(
      {
        required email,
        required password,
        required token,
      }
      )
  {
    emit(
      ResetPasswordLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: RESETPASSWORD,
      data: {
        'email': email,
        'password':password
      },
    ).then((value) {
      print(value?.data);
      emit(ResetPasswordSuccessState());
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        ResetPasswordErrorState(error.toString()),
      );
    });


  }
}
