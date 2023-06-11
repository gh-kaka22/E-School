part of 'register_admin_cubit.dart';

@immutable
abstract class RegisterAdminState {}

class RegisterAdminInitial extends RegisterAdminState {}
class RegisterAdminLoadingState extends RegisterAdminState{}
class RegisterAdminSuccessgState extends RegisterAdminState{
  final AdminModel adminModel;
  RegisterAdminSuccessgState(this.adminModel);
}
class RegisterAdminErrorState extends RegisterAdminState{
  final String error;
  RegisterAdminErrorState(this.error);

}
class RegisterChangePasswordVisibilityState extends RegisterAdminState{}

