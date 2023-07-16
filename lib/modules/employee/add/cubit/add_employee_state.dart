part of 'add_employee_cubit.dart';

@immutable
abstract class AddEmployeeState {}

class AddEmployeeInitial extends AddEmployeeState {}
class AddEmployeeLoadingState extends AddEmployeeState {}
class AddEmployeeSuccessgState extends AddEmployeeState {
  final EmployeeModel employeeModel;
  AddEmployeeSuccessgState(this.employeeModel);
}
class AddEmployeeErrorState extends AddEmployeeState {
  final String error;
  AddEmployeeErrorState(this.error);


}
