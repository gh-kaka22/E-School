import 'package:bloc/bloc.dart';
import 'package:e_school/models/show_absences_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  static AttendanceCubit get(context) => BlocProvider.of(context);
  ShowAbsencesModel? showAbsencesModel;
  List <dynamic>? absences;
  void getAbsences()
  {
    emit(AttendanceLoadingState());
    DioHelper.getData(
      url: ATTENDANCE,
      token: token
    ).then((value) {
      print(value?.data);
      showAbsencesModel=ShowAbsencesModel.fromJson(value?.data);
      print(showAbsencesModel?.status);
      print(showAbsencesModel?.message);
      absences=showAbsencesModel?.data;
      emit(AttendanceSuccessState(showAbsencesModel!));
    }).catchError((error){
      print(error.toString());
      emit(AttendanceErrorState(error.toString()));
    });

  }

}
