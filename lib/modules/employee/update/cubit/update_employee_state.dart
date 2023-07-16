part of 'update_employee_cubit.dart';

@immutable
abstract class UpdateEmployeeState {}

class UpdateEmployeeInitial extends UpdateEmployeeState {}
class UpdateEmployeeLoadingState extends UpdateEmployeeState {}
class UpdateEmployeeSuccessState extends UpdateEmployeeState {
  final EmployeeModel employeeModel;
  UpdateEmployeeSuccessState(this.employeeModel);
}
class UpdateEmployeeErrorState extends UpdateEmployeeState {
  final String error;
  UpdateEmployeeErrorState(this.error);

}

class GetEmployeeInitial extends UpdateEmployeeState {}
class GetEmployeeLoadingState extends UpdateEmployeeState {}
class GetEmployeeSuccessState extends UpdateEmployeeState {
  final EmployeeModel employeeModel;
  GetEmployeeSuccessState(this.employeeModel);
}
class GetEmployeeErrorState extends UpdateEmployeeState {
  final String error;
  GetEmployeeErrorState(this.error);

}
