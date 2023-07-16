import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/show_employee_model.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_employee_state.dart';

class ShowEmployeeCubit extends Cubit<ShowEmployeeState> {
  ShowEmployeeCubit() : super(ShowEmployeeInitial());
  static ShowEmployeeCubit get(context) => BlocProvider.of(context);
  ShowEmployeeModel? showEmployeeModel;
  List<dynamic>? employee ;
  void getEmployee()
  {
    emit(ShowEmployeeLoadingState());
    DioHelper.getData(
      url: SHOWEMPLOYEE,
      token: token,
    ).then((value) {
      print(value?.data);
      showEmployeeModel=ShowEmployeeModel.fromJson(value?.data);
      print(showEmployeeModel?.status);
      print(showEmployeeModel?.message);
      employee=showEmployeeModel?.data;
      emit(ShowEmployeeSuccessState(showEmployeeModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowEmployeeErrorState(error.toString()));
    });

  }

}
