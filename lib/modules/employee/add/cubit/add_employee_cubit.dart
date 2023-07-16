import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/employee_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit() : super(AddEmployeeInitial());
  static AddEmployeeCubit get(context)=>BlocProvider.of(context);
  EmployeeModel? employeeModel;
  void addEmployee(
      {
        required  fname,
        required  lname,
        required  address,
        required  phoneNumber,
        required job,

      })
  {
    emit(AddEmployeeLoadingState());
    DioHelper.postData(
        url: ADDEMPLOYEE,
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

      emit(AddEmployeeSuccessgState(employeeModel!));

    }).catchError((error){
      print('mmmmmmmmmmmmmmmm${error}');
      print(error.toString());
      emit(AddEmployeeErrorState(error.toString()));
    });

  }

}
