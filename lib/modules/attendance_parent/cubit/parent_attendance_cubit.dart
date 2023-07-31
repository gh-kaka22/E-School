
import 'package:e_school/models/show_absences_model.dart';
import 'package:e_school/modules/attendance_parent/cubit/parent_attendance_state.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentAttendanceCubit extends Cubit<ParentAttendanceState> {
  ParentAttendanceCubit() : super(ParentAttendanceInitial());
  static ParentAttendanceCubit get(context) => BlocProvider.of(context);
  ShowAbsencesModel? showAbsencesModel;
  List <dynamic>? absences;
  void getAbsencesParent(id)
  {
    emit(ParentAttendanceLoadingState());
    DioHelper.getData(
      url: '${PARENTATTENDANCE}/${id}',
      token: token
    ).then((value) {
      print(value?.data);
      showAbsencesModel=ShowAbsencesModel.fromJson(value?.data);
      print(showAbsencesModel?.status);
      print(showAbsencesModel?.message);
      absences=showAbsencesModel?.data;
      emit(ParentAttendanceSuccessState(showAbsencesModel!));
    }).catchError((error){
      print(error.toString());
      emit(ParentAttendanceErrorState(error.toString()));
    });

  }

}
