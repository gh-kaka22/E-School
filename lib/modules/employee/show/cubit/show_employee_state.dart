part of 'show_employee_cubit.dart';

@immutable
abstract class ShowEmployeeState {}

class ShowEmployeeInitial extends ShowEmployeeState {}
class ShowEmployeeLoadingState extends ShowEmployeeState {}
class ShowEmployeeSuccessState extends ShowEmployeeState {
  final ShowEmployeeModel showEmployeeModel;
  ShowEmployeeSuccessState(this.showEmployeeModel);
}
class ShowEmployeeErrorState extends ShowEmployeeState {
  final String error;
  ShowEmployeeErrorState(this.error);

}
