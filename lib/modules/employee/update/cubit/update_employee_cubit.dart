import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/employee_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'update_employee_state.dart';

class UpdateEmployeeCubit extends Cubit<UpdateEmployeeState> {
  UpdateEmployeeCubit() : super(UpdateEmployeeInitial());
  static UpdateEmployeeCubit get(context)=>BlocProvider.of(context);
  EmployeeModel? employeeModel;


  void updateEmployee(
      {
        fname,
        lname,
       address,
       phoneNumber,
       job,

      })
  {
    emit(UpdateEmployeeLoadingState());
    DioHelper.postData(
        url: EDITEMPLOYEE,
        token: token,
        data: {
          'first_name':fname,
          'last_name':lname,
          'phone_number':phoneNumber,
          'address':address,
          'job':job,
        }).then((value) {

      print(value?.data);
      employeeModel= EmployeeModel.fromJson(value?.data);
      print(employeeModel!.data!.firstName);
      print(employeeModel!.data!.lastName);

      emit(UpdateEmployeeSuccessState(employeeModel!));

    }).catchError((error){
      print('mmmmmmmmmmmmmmmm${error}');
      print(error.toString());
      emit(UpdateEmployeeErrorState(error.toString()));
    });

  }
  void getEmployeeData(student_id) {
    emit(GetEmployeeLoadingState());
    DioHelper.getData(
      url: '${GETEMPLOYEE}',
      token: token,
    ).then((value) {
      employeeModel = EmployeeModel.fromJson(value!.data);
      print(employeeModel!.data!.firstName);
      emit(GetEmployeeSuccessState(employeeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetEmployeeErrorState(error));
    });

}
}
